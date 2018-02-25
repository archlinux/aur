#
# PKGBUILD for asm6f
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=asm6f
pkgver=1.6
pkgrel=1
epoch=
_pkgname=asm6f
_pkgver=${pkgver}_freem01
pkgdesc="A 6502 assembler primarily targeted at NES/Famicom development."
arch=('i686' 'x86_64')
url="https://github.com/freem/asm6f"
license=()
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
noextract=()
_srcdirname=${_pkgname}-${_pkgver}
source=("https://github.com/freem/${_pkgname}/archive/v${_pkgver}.tar.gz")
md5sums=('bfea85be3a91fb651674fb9333fb76b0')

#
#
#

prepare() {
  cd "${srcdir}/${_srcdirname}"
}

build() {
  cd "${srcdir}/${_srcdirname}"
  make
}

check() {
  cd "${srcdir}/${_srcdirname}"
}

package() {
  cd "${srcdir}/${_srcdirname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp asm6f asm6f-unstable asm6f-hunstable "${pkgdir}/usr/bin"
  ln -s asm6f-hunstable "${pkgdir}/usr/bin/asm6f-highly-unstable"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp readme.txt readme-original.txt "${pkgdir}/usr/share/doc/${pkgname}"
}

# EOF
