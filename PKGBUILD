# Maintainer: link2xt <link2xt@testrun.org>
pkgname=liboprf
pkgver=0.9.4
pkgrel=1
pkgdesc="library providing OPRF and Threshold OPRF based on libsodium"
arch=(x86_64)
url="https://github.com/stef/liboprf"
license=('LGPL-3.0-or-later')
depends=('libsodium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stef/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/stef/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
noextract=()
b2sums=('b743b519900e320cf263f0c6989e80feb2f21ab511cc2447e8eb21e2610a5b24dc0f8f42ecc1a995d3359eadd71bdc6656eeb0d44b7bd4560fb73871b2b41d5c'
        'SKIP')
validpgpkeys=('AABDE16CB6AF5CD10A28DFF2970DEB6694D50988')

build() {
	cd "$pkgname-$pkgver"/src
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"/src
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
