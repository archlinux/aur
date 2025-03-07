# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=3.0.3
pkgrel=1
pkgdesc='Tetromino jigsaw puzzle game'
arch=(x86_64)
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('c4adb4a02b1c45553dbaaa8de96e95b9d3652c60e29d2ad2996a2b0c6be44ee8')

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
