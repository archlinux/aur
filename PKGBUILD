# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=guff
pkgver=0.1.0
pkgrel=1
pkgdesc="reads a stream of points from a file or stdin and plots them."
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/guff"
license=('MIT')
conflicts=('guff-git')
source=(https://github.com/silentbicycle/guff/archive/v$pkgver.tar.gz)
md5sums=('fe63a34dc79f3dd5442b785ab9722bee')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e 's/all: test_${PROJECT}/#all: test_${PROJECT}/' Makefile
        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -vDm755 $pkgname   "$pkgdir/usr/bin/$pkgname"
        install -vDm644 man/$pkgname.1    "$pkgdir/usr/share/man/man1/$pkgname.1"
}
