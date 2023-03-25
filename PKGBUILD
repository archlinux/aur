# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.13.0
pkgrel=1
pkgdesc='An Extremely Lightweight Specification Language'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('janet')
license=('BSD3')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('e7e131e4862dfca88eb214452d7e0231c57fcbba0ad1d36162d8d596e428c43d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 "build/pant" "${pkgdir}/usr/bin/pant"
}
