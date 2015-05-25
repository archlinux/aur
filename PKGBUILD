# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmpinboard
pkgver=1.0.1
pkgrel=1
pkgdesc="A WindowMaker dock applet resembling a miniature pinboard."
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/93"
url="http://web.archive.org/web/20121102091711/http://dockapps.windowmaker.org/file.php/id/93"
license=('GPL')
depends=('libxpm')
#source=("http://dockapps.windowmaker.org/download.php/id/131/${pkgname}-${pkgver}.tar.gz"
#	"${pkgname}.patch")
source=(https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b0f528a4e4b7debb9d3372a00c7eb7ed')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
