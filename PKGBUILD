# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributer: dedhart [dedinvegas@yahoo.com]

pkgname=wmsmixer
pkgver=0.5.1
pkgrel=2
pkgdesc="a hack to wmmixer which makes some changes to the display"
arch=('i686' 'x86_64')
url="http://dockapps.windowmaker.org/file.php/id/63"
license=('GPL')
depends=('libxpm' 'gcc-libs')
makedepends=('imake')
source=("http://dockapps.windowmaker.org/download.php/id/268/${pkgname}-${pkgver}.tar.gz"
	"wmsmixer.patch")
md5sums=('02ba412c97c7cc3365690fe74c99f145')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np2 -b -z .orig -i "${srcdir}/${pkgname}.patch"
  xmkmf -a
  make wmsmixer
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
md5sums=('02ba412c97c7cc3365690fe74c99f145'
         'ebaa6d3394ec845d2c8a2c41cb295d56')
md5sums=('02ba412c97c7cc3365690fe74c99f145'
         'f19e1e19c4312c9634590ea1a0983235')
