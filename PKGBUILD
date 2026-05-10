# Maintainer: M1829 <m1829js@gmail.com>
pkgname=libcmods
pkgver=2.7.30
pkgrel=2
pkgdesc='A dynamic dispatch runtime module system library for the C language in C23'
arch=('x86_64' 'i686')
url='https://codeberg.org/M1829/LibCMods'
license=('LGPL-3.0-or-later')
depends=('jemalloc')
source=("$pkgname-$pkgver::https://codeberg.org/M1829/LibCMods/archive/v$pkgver.tar.gz")
sha256sums=('272115619fd43152888de170aea06a1072e4e1417ef05f8964d04ab5827f5bf4')
makedepends=('gcc>=13.1')
options=('staticlibs')

build() {
	cd "$srcdir/$pkgname/build"
	./posix static
	./posix shared
}

package() {
	cd "$srcdir/$pkgname/build"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	PREFIX="$pkgdir/usr" bash posix install
}
