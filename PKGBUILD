# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.2
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='http://www.scarpetta.eu/page/pdf-mix-tool'
license=('GPL')
depends=('qt5-base' 'podofo' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt5-tools' 'discount')
source=("https://github.com/marcoscarpetta/pdfmixtool/archive/v${pkgver}.tar.gz")
sha512sums=('7176534606f61f10119fbfc6b7b3949e531b8d9aab9d2f740a7989a886420654017e72edc7ce3d27f5c731ade621acb15ac7d86f002fc2be6d7eaf37d4917bd7')

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
