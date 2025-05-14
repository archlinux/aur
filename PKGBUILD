#
# PKGBUILD for tass64
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=tass64
pkgver=1.60.3243
pkgrel=1
epoch=
pkgdesc="Cross assembler (TASS/TASM) targeting the MOS 65xx series of micro processors (6502/6510/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02/4510)"
arch=("x86_64" "i686")
url="https://tass64.sourceforge.net/"
license=("GPL-2.0-or-later")
_pkgname=64tass
_pkgver=${pkgver}
groups=()
depends=('glibc')
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
source=("https://sourceforge.net/projects/tass64/files/source/${_pkgname}-${pkgver}-src.zip")
noextract=()

sha256sums=('9d83be3d23a2c55e085b7c7a7856c2f96080447ea120a6a8c21a217ed76427f0')


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
  make prefix=/usr DESTDIR="${pkgdir}" install
  ln -s "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "${_pkgname}" "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

#
# EOF
#
