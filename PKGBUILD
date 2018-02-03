# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.2.1
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='http://www.scarpetta.eu/page/pdf-mix-tool'
license=('GPL')
depends=('qt5-base' 'podofo' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt5-tools' 'discount')
source=("https://github.com/marcoscarpetta/pdfmixtool/archive/v${pkgver}.tar.gz")
sha512sums=('9fc47df37f1d9e16efeb289f5cebb10458521ab9ab6a97e8fe3b8bb4cd05da9051cdd95beadaf010931f77045b0c6ddede544c5074900cfd8606233c69a9b4ed')

prepare() {
  cd "${srcdir}/pdfmixtool-${pkgver}"
  mkdir -p build
}

build() { 
  cd "${srcdir}/pdfmixtool-${pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/pdfmixtool-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
