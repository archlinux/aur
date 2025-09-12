# Maintainer: Paul Irofti <paul@irofti.net>
_pkgname=grpcio-testing
_filename=grpcio_testing
pkgname='python-grpcio-testing'
pkgver=1.74.0
pkgrel=1
pkgdesc="Testing utilities for gRPC Python"
arch=('any')
url="https://grpc.io/"
license=('Apache' )
depends=('python' 'python-grpcio' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_filename}-${pkgver}.tar.gz")
sha256sums=('11dedb53a410fe3b2a2bc9a9ed9c9a6979420c93243da7d787f7ccf9a2543e37')

build() {
  cd "$srcdir/$_filename-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_filename-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
