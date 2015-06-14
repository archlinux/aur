# Maintainer: Luis Sarmiento <lgsarmientop-ala-unal.edu.co>

pkgname=dawncut
pkgver=1.54a
_pkgver=1_54a
pkgrel=3
pkgdesc="Tool to generate a 3D DAWN scene data clipped with an arbitrary plane."
url="http://geant4.kek.jp/~tanaka/DAWN/About_DAWNCUT.html"
arch=('x86_64' 'i686')
license=('unknown')
depends=('dawn')
source=("http://geant4.kek.jp/~tanaka/src/${pkgname}_${_pkgver}.taz")
md5sums=('0c9f52f80c3fae6c37c58c6fd79bbb6b')

build() {
  cd "${srcdir}/${pkgname}_${_pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}_${_pkgver}"
  [ -d ${pkgdir}/usr/bin/ ] || install -d ${pkgdir}/usr/bin/
  install -m755 ${pkgname}  ${pkgdir}/usr/bin/

  _DOCDIR=usr/share/doc/${pkgname}
  [ -d ${pkgdir}/${_DOCDIR} ] || install -d ${pkgdir}/${_DOCDIR}
  install -m644 ${srcdir}/${pkgname}_${_pkgver}/*.html ${pkgdir}/${_DOCDIR}
}