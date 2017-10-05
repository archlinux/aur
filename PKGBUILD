# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.1
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='http://www.scarpetta.eu/page/pdf-mix-tool'
license=('GPL')
depends=('qt5-base' 'podofo' 'gtk-update-icon-cache')
makedepends=('git' 'cmake')
source=("https://github.com/marcoscarpetta/pdfmixtool/archive/v${pkgver}.tar.gz")
sha512sums=('6f512017764e1339e44726b225244676176bb1be0eda0bd39dbf5e7c11ea4734db5cdc88d72fba7b39af6cd2da1ec0d717c1ddfb65f2e43dce7faa7c0060caad')

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
