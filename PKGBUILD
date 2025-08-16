# Maintainer: Robert L Box <robertbox514@gmail.com>
# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=rsvndump
pkgver=0.6.2
pkgrel=1
pkgdesc="Remote Subversion repository dump."
url="http://rsvndump.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('apr' 'subversion' 'db')
makedepends=('gcc' 'make' 'db')
source=("http://prdownloads.sourceforge.net/rsvndump/${pkgname}-${pkgver}.tar.bz2")
md5sums=('57deff9a9e8d4ff70f0789ce278b1cc0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make install DESTDIR="$pkgdir"
}

