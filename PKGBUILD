# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=simsu
pkgver=1.4.1
pkgrel=1
pkgdesc='A basic Sudoku game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('53ae023270336eefa3fe936671fb910d7cfbad8d6b898cef13260861d573e9ff')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
