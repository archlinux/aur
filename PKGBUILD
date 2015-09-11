# Maintainer: minus <minus@mnus.de>
pkgname=cmdfs
pkgver=0.5
pkgrel=1
pkgdesc="A FUSE virtual file system that allows processing files with arbitrary commands."
arch=('x86' 'x86_64')
url="http://cmdfs.sourceforge.net/"
license=('GPL3')
depends=('fuse')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f72be0959a39a5e32909482839fd4ef8')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix="/usr" --localstatedir="/var"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix="$pkgdir/usr" --localstatedir="$pkgdir/var"
	make install
}
