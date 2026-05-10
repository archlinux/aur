# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.0.4
pkgrel=1
pkgdesc='An optimized hashset in C89, yielding maximum compatibility and great performance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('7c283862b337de900583c82bb6f01e33ae19e5af9901ea0854776a2c9956b565')
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
