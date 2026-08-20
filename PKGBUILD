# Maintainer: elbachir-one <bachiralfa@gmail.com>
pkgname=rawhex
pkgver=1.5
pkgrel=1
pkgdesc="A hex dumper in C with AVX2 SIMD formatting."
arch=('x86_64')
url="https://git.disroot.org/Vextoly/rawhex"
license=('Apache')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://git.disroot.org/Vextoly/rawhex/archive/$pkgver.tar.gz")
sha256sums=('53bd09da5eea00c1a22d76b744bcbe0f24d9c438d3c02275d133bdeb6dd2efab')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 rawhex "$pkgdir/usr/bin/rawhex"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
