# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tetzle
pkgver=3.0.4
pkgrel=1
pkgdesc='Tetromino jigsaw puzzle game'
arch=(x86_64)
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('caf4b4e955a91149b92160fc7abd49be3a41eba1e050145cb4d9161893e65d9e')

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
