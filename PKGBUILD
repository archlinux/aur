# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.28.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/awslabs/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-chevron' 'python-click' 'python-flask' 'python-boto3' 'python-jmespath' 'python-yaml'
         'python-cookiecutter' 'python-aws-sam-translator' 'python-docker' 'python-dateparser'
         'python-requests' 'python-serverlessrepo' 'python-aws-lambda-builders' 'python-tomlkit' 'python-watchdog')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fe450fe362e8c82251bf94041f54101355ac7876b1ac89725df42496196f19cd')

prepare() {
  cd "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
