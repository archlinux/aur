# Maintainer: M1829 <m1829js@gmail.com>
pkgname=libcmods
pkgver=2.7.28
pkgrel=1
pkgdesc='A dynamic dispatch runtime module system library for the C language in C23'
arch=('x86_64' 'i686')
url='https://codeberg.org/M1829/LibCMods'
license=('LGPL-3.0-or-later')
depends=('jemalloc')
source=('libcmods::git+https://codeberg.org/M1829/LibCMods.git')
source=("https://codeberg.org/M1829/LibCMods/archive/v$pkgver.tar.gz")
sha256sums=('f589744c99c2260de1f457d2785139d3b4e659852608ee2baa42b422260bd7e8')
makedepends=('git' 'gcc>=13.1')
makedepends=('gcc>=13.1')
options=('staticlibs')

build() {
	cd "$srcdir/$pkgname/build"
	PREFIX=/usr bash posix install
}

package() {
	cd "$srcdir/$pkgname/build"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	PREFIX="$pkgdir/usr" bash posix install
}
