# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributer: dedhart [dedinvegas@yahoo.com]

pkgname=wmsmixer
pkgver=0.5.1
pkgrel=4
pkgdesc="a hack to wmmixer which makes some changes to the display"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/63"
url="http://web.archive.org/web/20121021072220/http://dockapps.windowmaker.org/file.php/id/63"
license=('GPL')
depends=('libxpm')
makedepends=('imake')
#source=("http://dockapps.windowmaker.org/download.php/id/268/${pkgname}-${pkgver}.tar.gz"
#	"wmsmixer.patch")
source=("${pkgname}-${pkgver}.tar.gz"
	"wmsmixer.patch")
md5sums=('02ba412c97c7cc3365690fe74c99f145')

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
md5sums=('02ba412c97c7cc3365690fe74c99f145'
         'ebaa6d3394ec845d2c8a2c41cb295d56')
