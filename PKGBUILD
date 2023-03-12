# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.10.0
pkgrel=1
pkgdesc='An Extremely Lightweight Specification Language'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('janet')
license=('BSD3')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('7c0af1c9eee631bcb421a65d04f29b73a5b8fc4fbaf04b60b2ae3b2bdaa074ae')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 "build/pant" "${pkgdir}/usr/bin/pant"
}
