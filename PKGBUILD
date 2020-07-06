# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=feathernotes
pkgver=0.5.0
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/feathernotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/V${pkgver}.tar.gz")
sha256sums=('b477dac27c93b2c68674e741ef665df8a8b88070183a8ba81adffbe081990bde')

build() {
  rm -Rf build && mkdir build
  cd build
  qmake ${srcdir}/FeatherNotes-${pkgver}/
  make
}

package() {
  cd build
  make INSTALL_ROOT=${pkgdir} install
}
