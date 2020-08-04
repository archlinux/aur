# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-aws_lambda_builders
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc='Python library to compile, build & package AWS Lambda functions for several runtimes & framework'
arch=('any')
url="https://github.com/awslabs/aws-lambda-builders"
license=('Apache')
depends=('python-six' 'python-wheel')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9e7cd09b4f04574d96cdb880644e6c7fd1ad8bcc25c3aef3ed0268a5ada9a67')

package() {
  cd "$srcdir/$_name-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
