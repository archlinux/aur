# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool
pkgver=0.3.3
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='https://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt5-base' 'podofo-git')
makedepends=('cmake' 'qt5-tools')
source=("https://gitlab.com/scarpetta/pdfmixtool/-/archive/v${pkgver}/pdfmixtool-v${pkgver}.tar.gz")
sha512sums=('61c9fa4c36d11f93c117cca26a046c2a266f5e2023ce42dc2717131d975bdd566e71e27f45a32febc61f7cb0b062c6f2ca02b62922f62688957c646129e11f17')

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
