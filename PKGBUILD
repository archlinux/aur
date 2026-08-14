# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.10.1
pkgrel=1
pkgdesc='An optimized hashset in GNU C99, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('5a50bd5d994e367d8208dda789c0716c19bcbec57e5edadf06e6ea1d5617b0e0')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
