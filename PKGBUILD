# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-aws-lambda-builders
_name=${pkgname#python-}
pkgver=1.46.0
pkgrel=1
pkgdesc='Python library to compile, build & package AWS Lambda functions for several runtimes & framework'
arch=('any')
url="https://github.com/aws/aws-lambda-builders"
license=('Apache')
replaces=('python-aws_lambda_builders')
conflicts=('python-aws_lambda_builders')
depends=('python-six' 'python-wheel')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/aws/${_name}/archive/v$pkgver/${_name}-$pkgver.tar.gz")
sha256sums=('a5275063587891c2339b4416d7a4edf64e146c1249f6b57308baed0570b395ab')

package() {
  cd "$srcdir/$_name-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
