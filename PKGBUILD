# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.6.0
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('d97c088d772a0d7af1b1ae2228ab656c2e4cb02684ba1966d0a600563ac73e0c')

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
