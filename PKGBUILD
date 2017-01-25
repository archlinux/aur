# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

pkgname=ipkg
pkgver=0.99.163
pkgrel=2
pkgdesc="The Itsy Package Management System"
url="http://handhelds.org/moin/moin.cgi/Ipkg"
# Mirror from http://www.filewatcher.com/m/ipkg-0.99.163.tar.gz.470728-0.html
source=(ftp://ftp.osuosl.org/.2/nslu2/sources/${pkgname}-${pkgver}.tar.gz)
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
