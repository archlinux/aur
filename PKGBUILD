# $Id: PKGBUILD,v 1.12 2005/11/11 18:46:32 simo Exp $
# Maintainer: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=trang
_pkgname="jing-trang"
pkgver=20131210
pkgrel=1
pkgdesc="Converts between different schema languages for XML"
url="https://github.com/relaxng/jing-trang"
arch=('i686' 'x86_64')
license=('GPL')
depends=(java-runtime-headless)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/relaxng/${_pkgname}/archive/V${pkgver}.tar.gz"
	trang
)

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./ant
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -D -m644 build/trang.jar   "${pkgdir}/usr/share/java/trang.jar"
  install -D -m644 build/jing.jar    "${pkgdir}/usr/share/java/jing.jar"
  install -D -m644 build/dtdinst.jar "${pkgdir}/usr/share/java/dtdinst.jar"
  install -D -m755 "${srcdir}/trang" "${pkgdir}/usr/bin/trang" || return 1
}

sha256sums=('4cedef9de8d15f1bb5aa01620ffb1f9d55ab877419167c3a7b25b3caa8caad9d'
            '1641a4fa0578ddec1afb374a5da75be6816e659f60c98207619f656cb90ca135')
