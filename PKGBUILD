# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=feathernotes
pkgver=0.4.6
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherNotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'shared-mime-info' 'desktop-file-utils')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsujan/FeatherNotes/archive/V${pkgver}.tar.gz")
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
