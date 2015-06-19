# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=ddrutility
pkgver=2.7
pkgrel=1
pkgdesc="Set of utilities for use with GNU ddrescue to aid with data recovery"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ddrutility/"
license=('GPL3')
depends=('bash')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('687b1864ca2fc960f88051f1fd9ab1ce')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
    rmdir "$pkgdir/usr/share/aclocal"
}
