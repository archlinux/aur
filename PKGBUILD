# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.3.9
pkgrel=1
pkgdesc='Word unscrambling game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('58fdc21a3cfca9aea132ca06e96966c24a37225ae43ad95b174c3c933a6f4256')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
