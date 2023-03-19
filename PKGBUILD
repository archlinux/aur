# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.11.1
pkgrel=1
pkgdesc='An Extremely Lightweight Specification Language'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('janet')
license=('BSD3')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('5c8c43a0b6213940166caef956ef8884f5d6f5932a36ce0aae9c4edfff5d2461')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 "build/pant" "${pkgdir}/usr/bin/pant"
}
