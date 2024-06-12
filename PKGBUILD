# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI program that prints random words generated from the EFF Large Wordlist."
arch=('x86_64')
url="https://github.com/danny-kuehn/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=('go' 'make')
options=(!debug)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('ae7d18f8cfb61fb89e5252e2d96d8b82407a27a7553fc2611de51fa6557d31b0')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
