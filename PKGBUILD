# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.0.3
pkgrel=2
pkgdesc='An optimized hashset in C89, yielding maximum compatibility and great performance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('f34fa248d183fb146825bc115428a293a3a85361d9cfbbf207137f370e6825be')
makedepends=('gcc')
options=('staticlibs')

build() {
	cd "$srcdir/$pkgname"
	make clean shared clean static
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr"
}
