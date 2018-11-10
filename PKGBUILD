# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.3.4
pkgrel=2
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='https://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt5-base' 'podofo')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/pdfmixtool/-/archive/v${pkgver}/pdfmixtool-v${pkgver}.tar.gz")
sha512sums=('7c62cc0a7ee9e17f2a09d0c71eddd60edb730f659445c92f415b806c6c518c111f18fc96f75ae25e6932c43cf6e478325e5abb7da9457fcd9bebc35d69dca6bd')

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
