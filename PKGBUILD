# Contributor: Gernot Pansy <notz@gmx.at>
# Contributor:  <erm67@yahoo.it>
# Contributor:  Antonio Orefice <kokoko3k@gmail.com>

pkgname=dvbsnoop
pkgver=1.4.50
arch=('i686' 'x86_64')
pkgrel=2
license=('GPL')
pkgdesc="dvbsnoop is a DVB / MPEG stream analyzer program, which enables you to watch (live) stream information in human readable form"
url="http://dvbsnoop.sourceforge.net/"
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" )
md5sums=('68a5618c95b4372eea9ac5ec5005f299')
depends=('glibc')


build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
