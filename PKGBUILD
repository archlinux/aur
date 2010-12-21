# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=ipkg
pkgver=0.99.163
pkgrel=2
pkgdesc="The Itsy Package Management System"
url="http://handhelds.org/moin/moin.cgi/Ipkg"
source=(http://www.handhelds.org/download/packages/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0b10ad2924611bccaea8ddf98481a192')
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" install
	ln -s /usr/bin/ipkg-cl "$pkgdir/usr/bin/ipkg"
}
