# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset-cpp
pkgver=1.4.5
pkgrel=2
pkgdesc='MXSet is an optimized hashset library in GNU C89, yielding maximum compatibility and great performance, these are C++ bindings for that library.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('9999eb08bc555bb6d9d6715836704f871ae58454401991c5f5df6fb57f689178')
options=('staticlibs')
conflicts=('mxset')

package() {
	cd "$srcdir/mxset"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make cpp-install PREFIX="$pkgdir/usr" CXX=c++ CC=cc
}
