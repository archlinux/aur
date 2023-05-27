# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.15.0
pkgrel=1
pkgdesc='An Extremely Lightweight Specification Language'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('janet')
license=('BSD3')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('52df657845f87e51773eaf8e4033628baa0acbd110da0d5f91864d446758eab7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 "build/pant" "${pkgdir}/usr/bin/pant"
}
