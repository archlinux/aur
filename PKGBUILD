# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=grisbi
pkgver=1.0.2
pkgrel=2
pkgdesc="Personal financial management program"
arch=('i686' 'x86_64')
url="http://www.grisbi.org"
license=('GPL')
depends=('desktop-file-utils' 'gtk2')
makedepends=('gettext' 'grep' 'intltool')
optdepends=('goffice0.8: for drawing charts' 'libofx: support for the OFX banking standard')
options=(!libtool)
install=grisbi.install
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('f5ab794ab1b04141402ae50cdc2d37cfaf245ace422812b3193f9548605061d4')

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
