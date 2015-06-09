# Maintainer: Spider.007 <archPackage@spider007.net>
pkgname=scamper
pkgver=20140530
pkgrel=1
pkgdesc="designed to actively probe destinations in the Internet in parallel (at a specified packets-per-second rate) so that bulk data can be collected in a timely fashion"
url="http://www.caida.org/tools/measurement/scamper/"
source=("http://www.caida.org/tools/measurement/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
md5sums=('d87170ac8af04b459af30c96e5406041')
license=('gpl')
arch=('i686' 'x86_64')

build() {
	cd $srcdir/$pkgname-cvs-$pkgver

	./configure --prefix=/usr/
	make
}

package() {
	cd $srcdir/$pkgname-cvs-$pkgver

	make DESTDIR=$pkgdir install
	chmod u+s $pkgdir/usr/bin/scamper
}
