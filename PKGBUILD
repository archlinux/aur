# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=grisbi
pkgver=1.0.0
pkgrel=2
pkgdesc="Personal financial management program"
arch=('i686' 'x86_64')
url="http://www.grisbi.org"
license=('GPL')
depends=('desktop-file-utils' 'gtk2')
makedepends=('gettext' 'grep' 'intltool')
optdepends=('goffice8.0: for drawing charts' 'libofx: support for the OFX banking standard')
options=(!libtool)
install=grisbi.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('8a23d26777666814d918702ad9207bac433abd3ac71568d53f7c485670f92c55')

build() {
	cd "${pkgname}-${pkgver}"
	./configure \
		--disable-frenchdoc \
		--prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
