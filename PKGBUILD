# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.8.0
pkgrel=1
pkgdesc='An optimized hashset in GNU C89, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('3d8f10a6037cb46eb3308ad8508d120256d7128a46bc29cc61fa199b8182e827')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
