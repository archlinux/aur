# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.14.0
pkgrel=1
pkgdesc='An Extremely Lightweight Specification Language'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('janet')
license=('BSD3')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('ed555772d9a9773fdc3c5fd95226f20ce8e0f5bb4a71fcb647cb6830f553f84e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 "build/pant" "${pkgdir}/usr/bin/pant"
}
