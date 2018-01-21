# Maintainer: Bert Peters <bert@bertptrs.nl>
# Previously: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=trang
_pkgname="jing-trang"
pkgver=20151127
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

sha256sums=('04cdf589abc5651d40f44fbc3415cb094672cb3c977770b2d9f6ea33e6d8932b'
            '1641a4fa0578ddec1afb374a5da75be6816e659f60c98207619f656cb90ca135')
