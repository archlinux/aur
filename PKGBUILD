# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=grisbi
pkgver=1.0.1
pkgrel=1
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
sha256sums=('ed52fa6b3a7be3b0c588702e6d85afc8f6a699142eba0ae82eafcd360aee0414')

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
