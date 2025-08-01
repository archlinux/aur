# Maintainer: hanion <hanion@duck.com>
pkgname=cookc
pkgver=0.1.1
pkgrel=1
pkgdesc="A single file build system written in C"
arch=('x86_64')
url="https://github.com/hanion/cook"
license=('MIT')
makedepends=('gcc')
source=("https://github.com/hanion/cook/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2957ed51ef8e42f16493a9a34a46584b0cec51690f3e541fe6f20ba103378560')

build() {
	cd "$srcdir/cook-$pkgver"
	cc -o cook cook.c
}

package() {
	cd "$srcdir/cook-$pkgver"
	install -Dm755 cook "$pkgdir/usr/bin/cook"
}

