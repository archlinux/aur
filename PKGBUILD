# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-chess
pkgver=1.10.0
pkgrel=1
pkgdesc="A Python chess library with move generation/validation and
         PGN/Polyglot/Gaviota/Syzygy/UCI support"
arch=(any)
url=https://github.com/niklasf/python-chess
license=(GPL3)
depends=(python)
makedepends=(python python-build python-installer python-wheel python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/niklasf/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("832fa7d589ffe916f5e84f08ece0d634dfb50568867932e525edcebb573041df")

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
