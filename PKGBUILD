# Contributor: Sebastain Wolf <fatmike303 at gmail.com>
pkgname=cbmconvert
pkgver=2.1.2
pkgrel=2
pkgdesc="Create, extract and convert different Commodore binary archives."
arch=('i686' 'x86_64')
url="http://www.zimmers.net/anonftp/pub/cbm/crossplatform/converters/unix/cbmconvert.html"
license=('GPL')
source=(http://www.zimmers.net/anonftp/pub/cbm/crossplatform/converters/unix/$pkgname-$pkgver.tar.gz)
md5sums=('6f8baf36cee34d098bf780fee39615be')

build() {
    cd $srcdir/$pkgname-$pkgver
	make -f Makefile.unix || return 1
}

package() {
    cd $srcdir/$pkgname-$pkgver
	make -f Makefile.unix install DESTDIR="$pkgdir" || return 1
	install -D -m644 cbmconvert.1 $pkgdir/usr/man/man1/cbmconvert.1
	install -D -m644 disk2zip.1 $pkgdir/usr/man/man1/disk2zip.1
	install -D -m644 zip2disk.1 $pkgdir/usr/man/man1/zip2disk.1
}
