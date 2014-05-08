# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmpinboard
pkgver=1.0
pkgrel=2
pkgdesc="A WindowMaker dock applet resembling a miniature pinboard."
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/93"
url="http://web.archive.org/web/20121102091711/http://dockapps.windowmaker.org/file.php/id/93"
license=('GPL')
#source=("http://dockapps.windowmaker.org/download.php/id/131/${pkgname}-${pkgver}.tar.gz"
#	"${pkgname}.patch")
source=("${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.patch")
md5sums=('40b1353b213c538042660cb96cd0610a'
         '0b13799688efc221a055a35770effd32')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <"${srcdir}/${pkgname}.patch"
  autoreconf -fiv
  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
