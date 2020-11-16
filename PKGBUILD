# Maintainer: FishHawk <whang177@gmail.com>

pkgname=fez-dot
_pkgname=FezDot
pkgver=0.1.0
pkgrel=1
pkgdesc="A rotating translucent four dimensions hypercube"
arch=('x86_64')
url="https://github.com/FishHawk/FezDot"
license=('GPL')
depends=('qt5-declarative')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FishHawk/FezDot/archive/$pkgver.tar.gz")
sha256sums=('9ce6bc032ed31b3c1752c1f62df5f9656ecfb0c591a828cdb89a746d9b60e8d4')

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