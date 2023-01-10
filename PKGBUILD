# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=gottet
pkgver=1.2.2
pkgrel=1
pkgdesc='Falling blocks game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9f594db87c7b6ce62f105578c100ce8dac62485c6d9b09be506166a1780092d0')

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
