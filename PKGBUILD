# Maintainer: FishHawk <whang177@gmail.com>

pkgname=fez-dot
_pkgname=FezDot
pkgver=0.1.0
pkgrel=2
pkgdesc="A rotating translucent four dimensions hypercube"
arch=('x86_64')
url="https://github.com/FishHawk/FezDot"
license=('GPL')
depends=('qt5-quickcontrols2')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FishHawk/FezDot/archive/$pkgver.tar.gz")
sha256sums=('d199bb2ee8ea3bb5f967cb9e853fa685c856788543d4a31916a003d926ade278')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir" install
}