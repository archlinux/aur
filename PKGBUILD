# Maintainer: Spider.007 <archPackage@spider007.net>
pkgname=scamper
pkgver=20191102b
pkgrel=1
pkgdesc="designed to actively probe destinations in the Internet in parallel (at a specified packets-per-second rate) so that bulk data can be collected in a timely fashion"
url="http://www.caida.org/tools/measurement/scamper/"
source=("http://www.caida.org/tools/measurement/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
sha256sums=('bb9199476a94c922bac8d5337ac35abd559027152a7147e7a07bd5022fc59dba')
depends=('openssl')
license=('gplv2')
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
