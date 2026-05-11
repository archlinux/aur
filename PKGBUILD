# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.2.3
pkgrel=2
pkgdesc='An optimized hashset in C89, yielding maximum compatibility and great performance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('92458cf93a631e54d983f30b4ed4bf8c8c36d4d58f1ffa2d1f0baac1242eeabc')
makedepends=('gcc')
options=('staticlibs')

build() {
	cd "$srcdir/$pkgname"
	make shared static
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr"
}
