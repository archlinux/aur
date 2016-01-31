# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: UshakovVasilii <UshakovVasilii@yahoo.com>
# Contributor: Charon77 <evans.jahja@yahoo.com>
# Contributor: debdj <debd92@gmail.com>

pkgname=florence
pkgver=0.6.3
pkgrel=2
pkgdesc="A configurable on-screen virtual keyboard"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/florence/"
license=('GPL')
depends=('gtk3' 'libxml2' 'librsvg' 'libxtst' 'gettext' 'gstreamer>=1.0') # http://florence.sourceforge.net/english/install.html
makedepends=('intltool>=0.23' 'gnome-doc-utils')
install="${pkgname}.install"
source=("http://sourceforge.net/projects/florence/files/florence/${pkgver}/florence-${pkgver}.tar.bz2")
sha256sums=('422992fd07d285be73cce721a203e22cee21320d69b0fda1579ce62944c5091e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr \
		--without-notification \
		--without-at-spi \
		--with-panelapplet \
		--with-xtst \
		--with-docs \
		--disable-static

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
