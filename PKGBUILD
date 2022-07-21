# Maintainer: Spider.007 <archPackage@spider007.net>
pkgname=scamper
pkgver=20211212a
pkgrel=1
pkgdesc="designed to actively probe destinations in the Internet in parallel (at a specified packets-per-second rate) so that bulk data can be collected in a timely fashion"
url="http://www.caida.org/tools/measurement/scamper/"
source=("https://www.caida.org/catalog/software/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
sha256sums=('d986b429655dce36629d1821ea6f32d65cc418f7d22b1ea4330621bffb35c18c')
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
