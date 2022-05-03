# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=2.2.1
pkgrel=1
pkgdesc='A tetromino jigsaw puzzle game'
arch=(x86_64)
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('ca5cc2837c3a3fa959655e140821e99104b88765bfd2e777e5d6a18b3f2592d4')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
