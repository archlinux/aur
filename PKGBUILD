# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmsysmon
pkgver=0.7.7
pkgrel=1
pkgdesc="A WindowMaker dock applet for system monitoring."
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/93"
license=('GPL')
depends=('libx11' 'libxext' 'libxcb' 'libxau')
source=("http://www.gnugeneration.com/software/wmsysmon/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.patch")
md5sums=('0f8ec86a9808f5123c22ff427559fc48'
         '294458cf7791c083fa162e718541cea5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <"${srcdir}/${pkgname}.patch"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
