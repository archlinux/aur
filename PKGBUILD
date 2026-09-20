# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=bagatto
pkgver=0.9.0
pkgrel=1
pkgdesc='A transparent, extensible static site generator'
arch=('x86_64')
url='https://bagatto.co/'
makedepends=('janet>=1.38.0' 'jpm')
optdepends=('janet: use janet to extend sites')
license=('BSD3')
provides=('bagatto')

source=("https://git.sr.ht/~subsetpark/bagatto/archive/v${pkgver}.tar.gz")

sha256sums=('dc4678b3d8a66ae05faa49df97107a0d3dcf1ad9724c2d05e31ec413124f03a5')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
        jpm -l load-lockfile
        jpm -l build
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
        install -Dm755 build/bag "${pkgdir}/usr/bin/bag"
}
