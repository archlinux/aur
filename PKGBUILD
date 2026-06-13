# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.7.6
pkgrel=1
pkgdesc='An optimized hashset in GNU C89, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('a7fe66bf964b88e57f5a3deb7a2b2eae9d43d0683b8ce09c28e171f053c7b623')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
