# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=gottet
pkgver=1.2.6
pkgrel=1
pkgdesc='Falling blocks game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a0983641a14552b2363f9b7ac2bc546f58169315d924f43cabceb2bd062986b0')

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
