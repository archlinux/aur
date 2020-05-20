#
# PKGBUILD for IDE65XX
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
_prjname=IDE65XX
pkgname=ide65xx
pkgver=0.1Beta
pkgrel=1
epoch=
pkgdesc="IDE for 6502, 6510, C64 projects uses Kick Assembler"
arch=('i686' 'x86_64')
url="https://sites.google.com/view/ide65xx"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/emartisoft/${_prjname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('9f1e9350b362e81a6870c5e4c175a6d6')


prepare() {
  cd "${srcdir}/${_prjname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_prjname}-${pkgver}"
  qmake
  make
}

check() {
  cd "${srcdir}/${_prjname}-${pkgver}"
}

package() {
  cd "${srcdir}/${_prjname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0755 IDE65xx "${pkgdir}/usr/local/bin/IDE65xx"
}

# EOF
