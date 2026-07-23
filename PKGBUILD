# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=tanglet
pkgver=1.6.10
pkgrel=1
pkgdesc='Single player word finding game'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0a35cd1e478cc99a7cdf9bcc6c87a203f9a8e2ab0123eeeca1b0c92a12e1c962')

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
