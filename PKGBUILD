# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.7.0
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('x86_64')
url="https://gottcode.org/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'qt6-base' 'kdsingleapplication')
makedepends=('appstream' 'cmake' 'qt6-tools')
source=("https://gottcode.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ff86ff05c5b753cdf8c31c1e70fe37b251b53544a4a59a52bb2ef1c9d63af94c')

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
