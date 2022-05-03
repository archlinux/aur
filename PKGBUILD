# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=peg-e
pkgver=1.3.1
pkgrel=1
pkgdesc='Peg elimination game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('b6f510de5523d8b9da6b06c1682eb93f86f264651cc3b4295e0033f8a1464176')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
