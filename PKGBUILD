# Maintainer: hanion <hanion@duck.com>
pkgname=mite
pkgver=1.4.3
pkgrel=1
pkgdesc="Static site generator with C templates"
arch=('x86_64')
url="https://github.com/hanion/mite"
license=('MIT')
source=("https://github.com/hanion/mite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a3deb552a4298e70f18dc075a51b7d95c80f51f2c8ff6d8666891c53a9b843a')

build() {
	cd "$srcdir/mite-$pkgver"
	cc -o mite -O3 mite.c -static
}

package() {
	cd "$srcdir/mite-$pkgver"
	install -Dm755 mite "$pkgdir/usr/bin/mite"
	install -Dm644 mite.c "$pkgdir/usr/share/mite/mite.c"
}

