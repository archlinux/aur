# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset-cpp
pkgver=1.7.4
pkgrel=2
pkgdesc='MXSet is an optimized hashset library in GNU C89, these are C++ bindings for that library.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('6277750d3d9cd29096eaa70f9b411880cf8d65644f18c8af29511a8575245c91')
options=('staticlibs')
conflicts=('mxset')

package() {
	cd "$srcdir/mxset"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make cpp-install PREFIX="$pkgdir/usr" CXX=c++ CC=cc
}
