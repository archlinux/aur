# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.3
pkgrel=2
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois/"
license=('GPL3')
depends=('gtkmm' 'libxml++')
source=("http://download.savannah.gnu.org/releases/galois/source/galois-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
	cd "${pkgdir}/usr"
	mv games bin
}

md5sums=('379b33ac28b1c5140c59aefae0b69964')
