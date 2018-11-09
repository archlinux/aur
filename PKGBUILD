# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.3.4
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='https://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt5-base' 'podofo')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/pdfmixtool/-/archive/v${pkgver}/pdfmixtool-v${pkgver}.tar.gz")
sha512sums=('e17945aa05b5a1a0892ea94adf7f7c829c9ec0b8f6f720278a8fd54aa817f955e0c14de19878bda257e10467032818a4ca245819a5d82ad09f2c04241c7ef863')

prepare() {
  cd "${srcdir}/pdfmixtool-v${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/pdfmixtool-v${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/pdfmixtool-v${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
