# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=cutemaze
pkgver=1.3.0
pkgrel=1
pkgdesc='Top-down maze game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('87bf87d84dfb6554a794f6ba203fa5344bc5b54e4f7dd3129418ea06e9a88e85')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
