# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.3
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='http://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt5-base' 'podofo-git' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt5-tools' 'discount')
source=("https://github.com/marcoscarpetta/pdfmixtool/archive/v${pkgver}.tar.gz")
sha512sums=('b6348453c5e191a5594193763d4588ff9ac1854a36f514f069db83a9106f9d462d07f1b4425fac7e7688da885a09d40e4f1c2571108c65ee03188b740bdc1ebc')

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
