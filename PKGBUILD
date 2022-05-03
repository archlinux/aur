# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=cutemaze
pkgver=1.3.1
pkgrel=1
pkgdesc='Top-down maze game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('6944931cd39e9ef202c11483b7b2b7409a068c52fa5fd4419ff938b1158c72ab')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
