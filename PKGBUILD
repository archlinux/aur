#
# PKGBUILD for tass64
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=tass64
pkgver=1.54.1900
pkgrel=1
epoch=
pkgdesc="tass64 is cross (turbo) assembler targeting the MOS 65xx series of micro processors (6502/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02)"
arch=('i686' 'x86_64')
url="http://tass64.sourceforge.net/"
license=('GPLv2')
_pkgname=64tass
_pkgver=${pkgver}
groups=()
depends=()
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
source=("http://sourceforge.net/projects/tass64/files/source/${_pkgname}-${pkgver}-src.zip")
noextract=()
md5sums=('a06434a6c8b82baafaa72126a2f7ef0e')


prepare()
{
  cd "${srcdir}/${_pkgname}-${pkgver}-src"
}

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}-src"
  make -w --trace
}

check()
{
  cd "${srcdir}/${_pkgname}-${pkgver}-src"
  #make -w --trace -k check
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}-src"
  make DESTDIR="${pkgdir}" install
}

#
# EOF
#
