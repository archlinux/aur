# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset-cpp
pkgver=1.7.6
pkgrel=1
pkgdesc='MXSet is an optimized hashset library in GNU C89, these are C++ bindings for that library.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('a7fe66bf964b88e57f5a3deb7a2b2eae9d43d0683b8ce09c28e171f053c7b623')
options=('staticlibs')
conflicts=('mxset')

package() {
	cd "$srcdir/mxset"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make cpp-install PREFIX="$pkgdir/usr" CXX=c++ CC=cc
}
