# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: archlinux.info:tdy

pkgname=python-chess
pkgver=0.31.0
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and
         PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=(GPL3)
depends=(python)
makedepends=(python python-setuptools)
source=("${pkgname}-${pkgver}::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("d354bc18dd18e3649ff7f7f646d0f90f20fde45a61e0874ac878f0261efd5d3f")

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
