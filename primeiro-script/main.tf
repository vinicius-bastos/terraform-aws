terraform {
    required_version = "1.3.8"

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "4.54.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "bucket-vinicius-aws-terraform"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "my-test-bucket_acl" {
  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}