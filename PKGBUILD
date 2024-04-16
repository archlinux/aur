# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=gottet
pkgver=1.2.4
pkgrel=1
pkgdesc='Falling blocks game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL3')
depends=('qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('30063fa813617e201bcaae62ebc6f35d60ca8869bed0a5517aac52ea3cb526be')

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
