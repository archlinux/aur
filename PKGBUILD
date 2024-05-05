# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-aws-lambda-builders
_name=${pkgname#python-}
pkgver=1.49.0
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
sha256sums=('d5973584a6e0575f6f8fa9723d9d051c51547eec77217ca1f0d77224ef55f866')

package() {
  cd "$srcdir/$_name-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
