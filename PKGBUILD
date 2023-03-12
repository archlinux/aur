# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=erasmus
pkgver=0.1.1
pkgrel=1
pkgdesc='Minimal zettelkasten-inspired note-taking'
arch=('x86_64')
url='https://git.sr.ht/~subsetpark/erasmus'
makedepends=('janet' 'pkg-config' 'libedit')
license=('BSD3')
provides=('ec')

source=("${url}/archive/v${pkgver}.tar.gz")

sha256sums=('5e9000dc9d67d5cd91c4eeb9794cfe7bdbb5d81af3be97fd349cf9c9918c64a9')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
        zig build -Drelease-fast=true -fstage1
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
        install -Dm755 "zig-out/bin/er" "${pkgdir}/usr/bin/er"
}
