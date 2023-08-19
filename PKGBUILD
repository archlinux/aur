# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ratfor
pkgver=1.0
pkgrel=2
pkgdesc='Preprocessor for fortran'
url='https://github.com/aksr/ratfor77'
license=('unknown')
arch=('x86_64' 'i686')
makedepends=('git' 'setconf')
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd $srcdir/$pkgname
	setconf Makefile ALL ratfor77
}

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	cd $srcdir/$pkgname
	install -D -m755 ratfor77 "$pkgdir/usr/bin/ratfor"
	install -D -m644 ratfor.man "$pkgdir/usr/share/man/man1/ratfor.1"
	install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
