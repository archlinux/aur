# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=gottet
pkgver=1.2.8
pkgrel=1
pkgdesc='Falling blocks game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7d7a4cbdf6c1fb5671d6312cb4ede874575faf87ba9d3983d1ef4d83f01e14f8')

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
