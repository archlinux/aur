# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributer: dedhart [dedinvegas@yahoo.com]

pkgname=wmsmixer
pkgver=0.5.1
pkgrel=6
pkgdesc="a hack to wmmixer which makes some changes to the display"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmsmixer"
license=('GPL')
depends=('libxpm')
makedepends=('imake')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz"
	"wmsmixer.patch")
md5sums=('41d64b4a79756ded25ddb614d574114b'
         'ebaa6d3394ec845d2c8a2c41cb295d56')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <"${srcdir}/${pkgname}.patch"
  xmkmf -a
  make wmsmixer
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
