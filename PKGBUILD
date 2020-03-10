# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=liri-calculator
pkgver=1.3.0
pkgrel=1
pkgdesc="More than a simple cross-platform Material Design calculator"
arch=("x86_64")
url="https://github.com/lirios/calculator"
license=("GPL")
depends=('fluid')
makedepends=('liri-cmake-shared' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/calculator/archive/v$pkgver.tar.gz")
sha512sums=('9b5a28a5b95894983027bac8feda3359b29cf5fda96722b586c550210b6bab4ea15bfd5146c8be12d88807d3b08bf2de6e1178c1b27fa6d9e4aa905d0e8646ef')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../calculator-$pkgver
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
