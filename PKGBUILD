# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.3.2
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='https://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt5-base' 'podofo-git')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/pdfmixtool/-/archive/v${pkgver}/pdfmixtool-v${pkgver}.tar.gz")
sha512sums=('258d273fa9daae8af61031264d50bd0f49bd87463033eb64fcf3fadab2c62b59bbff349afde23fda143ff1e62fc8130490b86066675be316adfed168b4f72cb4')

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
