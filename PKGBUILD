# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=feathernotes
pkgver=0.7.0
pkgrel=1
pkgdesc='Lightweight Qt hierarchical notes-manager for Linux.'
arch=('i686' 'x86_64')
url='https://github.com/tsujan/feathernotes'
license=('GPL3')
depends=('qt5-x11extras' 'qt5-svg' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('qt5-translations: localized keyboard shortcuts')
source=("${url}/releases/download/V${pkgver}/feathernotes-${pkgver}.tar.xz"{,.asc})
sha256sums=('f523e1aa23017d960dd82469fa35a14a98fea9833760192dd83da0d9bc306751'
            'SKIP')
validpgpkeys=('19DFDF3A579BD509DBB572D8BE793007AD22DF7E')

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
