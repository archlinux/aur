# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=feathernotes
pkgver=0.6.0
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/feathernotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/V${pkgver}.tar.gz")
sha256sums=('87b939e4248db432dd8427ae650f33f88b708ef448f8860d74b9a00a3a29fee1')

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
