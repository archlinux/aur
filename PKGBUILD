# Maintainer: Shatur <genaloner@gmail.com>

pkgname=akd
pkgver=2.3.0
pkgrel=1
pkgdesc='A Keyboard userspace daemon'
arch=(x86_64)
url=https://github.com/Shatur95/akd
license=(GPL3)
depends=(libx11 boost)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('0e7ab5236f3f644674fcb51f18ad2fc7d8ba0b7a946d0405a492ac1ba481f82a')

build() {
  cd $pkgname-$pkgver

  cmake -B build -D CMAKE_INSTALL_PREFIX="$pkgdir/usr"
  cmake --build build
}

package() {
  cd $pkgname-$pkgver

  cmake --install build
}
