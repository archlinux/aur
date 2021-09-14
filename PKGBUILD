# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=bagatto
pkgver=0.6.1
pkgrel=1
pkgdesc='A transparent, extensible static site generator'
arch=('x86_64')
url='https://bagatto.co/'
depends=('janet-lang-git')
license=('BSD3')
provides=('bagatto')

source=("https://git.sr.ht/~subsetpark/bagatto/archive/v${pkgver}.tar.gz")

sha256sums=('db137528561c8da1e9ed10c7f5987dc4fbc854267baaafe0d5f499079496d4a8')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
        install -Dm755 build/bag "${pkgdir}/usr/bin/bag"
}
