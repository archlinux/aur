# Maintainer: Paul Irofti <paul@irofti.net>
_pkgname=grpcio-testing
pkgname='python-grpcio-testing'
pkgver=1.36.1
pkgrel=1
pkgdesc="Testing utilities for gRPC Python"
arch=('any')
url="https://grpc.io/"
license=('Apache' )
depends=('python' 'python-grpcio' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6b81751325ad8b3f794182f004adbb28f8d5d7a71ba6c3486c284b178c0d2249')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
