# Maintainer: Paul Irofti <paul@irofti.net>
_pkgname=grpcio-testing
pkgname='python-grpcio-testing'
pkgver=1.54.2
pkgrel=1
pkgdesc="Testing utilities for gRPC Python"
arch=('any')
url="https://grpc.io/"
license=('Apache' )
depends=('python' 'python-grpcio' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a8230e8d27deede1885b2a264cb88bacbaedfc67a498b76530ed959cf8a1808d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
