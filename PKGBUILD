# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=hexalate
pkgver=1.2.5
pkgrel=1
pkgdesc='Color matching game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6978c5bcbf8bc24f5e257bb9c83f2dd572a232640623e4b870fc4fefb4416ed5')

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
