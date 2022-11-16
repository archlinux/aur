# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-aws-lambda-builders
_name=${pkgname#python-}
pkgver=1.23.0
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
sha256sums=('d4d3548788ddcd1022df8a7778f664354c6d16d5f774a301f9c00299319880c5')

package() {
  cd "$srcdir/$_name-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
