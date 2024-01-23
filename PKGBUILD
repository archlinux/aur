# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.108.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/aws/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-aws-lambda-builders' 'python-aws-sam-translator' 'python-boto3' 'python-cfn-lint'
         'python-chevron' 'python-click' 'python-cookiecutter' 'python-dateparser' 'python-docker' 'python-flask'
         'python-jmespath' 'python-pyopenssl' 'python-requests' 'python-rich' 'python-ruamel-yaml' 'python-tomlkit'
         'python-typing-extensions' 'python-watchdog' 'python-yaml' 'python-mypy-boto3-apigateway'
         'python-mypy-boto3-cloudformation' 'python-mypy-boto3-ecr' 'python-mypy-boto3-iam' 'python-mypy-boto3-lambda'
         'python-mypy-boto3-s3' 'python-mypy-boto3-schemas' 'python-mypy-boto3-secretsmanager'
         'python-mypy-boto3-signer' 'python-mypy-boto3-stepfunctions' 'python-mypy-boto3-sts' 'python-mypy-boto3-xray'
         'python-mypy-boto3-kinesis' 'python-mypy-boto3-sqs'
        )
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('18b15c9fff8d4f18b1d2876e9685a9893a76b82329ef6fde63cc8adc666bcc26')

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
