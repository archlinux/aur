#
# PKGBUILD for naken_asm-git
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=naken_asm-git
pkgver=r2137.65d74a37
pkgrel=1
epoch=
_pkgname=naken_asm
_pkgver=${pkgver}
pkgdesc="Assembler for MSP430, dsPIC, ARM, MIPS, 65xx, 68000, 8051/8052, Atmel AVR8, and others"
arch=('i686' 'x86_64')
url="http://www.mikekohn.net/micro/naken_asm.php"
license=("GPL3")
groups=()
depends=("readline")
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
noextract=()
#_srcdirname=${_pkgname}-${_pkgver}
#source=("https://github.com/mikekrohn/${_pkgname}/archive/v${_pkgver}.tar.gz")
_srcdirname=${_pkgname}
source=("git+https://github.com/mikeakohn/naken_asm.git")
md5sums=("SKIP")

#
#
#

pkgver() {
  cd "${srcdir}/${_srcdirname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "${srcdir}/${_srcdirname}"
  #patch -p0 < ${startdir}/configure-include-path.patch
  #patch -p0 < ${startdir}/makefile_add_naken_prog.patch
}

build() {
  cd "${srcdir}/${_srcdirname}"
  ./configure --install-prefix=${pkgdir}/usr --include-path=/usr/share/${_pkgname}/includes
  make
}

check() {
  cd "${srcdir}/${_srcdirname}"
}

package() {
  cd "${srcdir}/${_srcdirname}"
  make install
}

# EOF
