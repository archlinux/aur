# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.12.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/awslabs/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-click' 'python-flask' 'python-boto3' 'python-jmespath' 'python-yaml' 'python-cookiecutter'
         'python-aws-sam-translator' 'python-docker' 'python-dateparser' 'python-dateutil' 'python-requests'
         'python-serverlessrepo' 'python-aws_lambda_builders' 'python-tomlkit' 'python-chevron')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1be7fe8d149b82949bd8c7ddbc90517dc436811b41888c8680235ed7b84f75e3')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
