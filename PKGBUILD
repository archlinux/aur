# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=rsvndump
pkgver=0.6
pkgrel=1
pkgdesc="Remote Subversion repository dump."
url="http://rsvndump.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('subversion')
source=("http://prdownloads.sourceforge.net/rsvndump/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d613a1d7cdab62f225271e18db098dbe')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make install DESTDIR="$pkgdir"
}

