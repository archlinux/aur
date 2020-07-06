# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=feathernotes
pkgver=0.4.6
pkgrel=2
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/feathernotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/V${pkgver}.tar.gz")
sha256sums=('e2711cbc420532fc27fa596fe4aa51067ff312ec5c47639a113088167308e394')

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
