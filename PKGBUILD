# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=wxedid
pkgver=0.0.31
pkgrel=1
pkgdesc='wxWidgets-based EDID (Extended Display Identification Data) editor'
arch=('x86_64')
url='https://sourceforge.net/projects/wxedid/'
license=('GPL3')
depends=('wxwidgets-gtk3')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e83ce46912ef1a43bccfa4e4086697cfec444ef932040e618210d682a6fa4a40bf78aece953e10a959ae7a38671b5782a0a4562cd776f71b5784c3bd1fcda5d')

build() {
	cd "${pkgname}-${pkgver}"
	autoreconf -f -i
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
