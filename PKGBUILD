#
# PKGBUILD for dxa65
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=dxa65
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc="Disassembler for MOS 6502 and compatible CPUs"
arch=('i686', 'x86_64')
_pkgname=dxa
url="http://www.floodgap.com/retrotech/xa#dxa"
license=('GPL')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=('unadf')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.floodgap.com/retrotech/xa/dists/${_pkgname}-${pkgver}.tar.gz)
noextract=()
md5sums=('4fb88a7eda5939472b3a1d1c48b057fc')


prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  mkdir -p ${pkgdir}/usr/local/bin
  cp ${srcdir}/${_pkgname}-${pkgver}/dxa ${pkgdir}/usr/local/bin/dxa65
  mkdir -p ${pkgdir}/usr/local/man/man1
  cp ${srcdir}/${_pkgname}-${pkgver}/dxa.1 ${pkgdir}/usr/local/man/man1

  mkdir -p ${pkgdir}/usr/local/doc/${pkgname}
  cp ${srcdir}/${_pkgname}-${pkgver}/INSTALL ${pkgdir}/usr/local/doc/${pkgname}/

}

# EOF
