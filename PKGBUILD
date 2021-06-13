# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.4.0
pkgrel=1
pkgdesc='A basic Sudoku game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('6db0c004de67c122ac67f34cc6c1a68cd78be02034eceeab922848f87cb85e87')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
