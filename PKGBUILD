# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=erasmus
pkgver=0.1.2
pkgrel=1
pkgdesc='Minimal zettelkasten-inspired note-taking'
arch=('x86_64')
url='https://git.sr.ht/~subsetpark/erasmus'
makedepends=('zig')
license=('BSD3')

source=("${url}/archive/v${pkgver}.tar.gz")

sha256sums=('1528600ab000eca12846290cfc1d56763918e204f4f5111d796f528cb98446f5')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
        zig build -Doptimize=ReleaseFast
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
        install -Dm755 "zig-out/bin/er" "${pkgdir}/usr/bin/er"
}
