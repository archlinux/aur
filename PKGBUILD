# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azdrawing
pkgver=1.5
pkgrel=8
pkgdesc="Painting software for line art and comics."
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azdrawing.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxft')
makedepends=('libxfixes')
source=("http://azsky2.html.xdomain.jp/arc/${pkgname}-${pkgver}.tar.bz2")
md5sums=('93941ba7344bba236f658fbd69d99cfb')

build() {
	cd ${pkgname}-${pkgver}
	make prefix=/usr 
}

package() {
	cd ${pkgname}-${pkgver}
	make prefix=${pkgdir}/usr install
	rm -f ${pkgdir}/usr/share/icons/hicolor/icon-theme.cache # HACK: For `exists in filesystem` error.
}
