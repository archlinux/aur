# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-socketfromfd
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=2
pkgdesc="socket.fromfd() with auto-detection of family and type"
arch=(any)
url="https://github.com/tiran/socketfromfd"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiran/socketfromfd/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d1bcb4e66913cd3c9e988e2d3bdeee19d10a804bf6a0c243061da95f61802fe56a8192f622f8235b776d067aab83a89f69f08af462fa7fca5ee00dedec26c18c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
