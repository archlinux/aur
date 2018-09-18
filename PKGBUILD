# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=feathernotes
pkgver=0.4.5
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/FeatherNotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'shared-mime-info' 'desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsujan/FeatherNotes/archive/V${pkgver}.tar.gz")
sha256sums=('8782922f66c146651a6275a01a5e2e6b990031bdbeda3035249174fb0287e752')

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
