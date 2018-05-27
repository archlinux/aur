# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.3.1
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='http://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt5-base' 'podofo-git' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt5-tools' 'discount')
source=("https://github.com/marcoscarpetta/pdfmixtool/archive/v${pkgver}.tar.gz")
sha512sums=('c7cbfe1c5aac1ed35e49fa07ab417cd48ad952fa0e96b68ad7d8aeb6f3cf799a83438d6b188778a45c68064fcd7d3193d19453df063ef1107eac7478a97eb294')

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
