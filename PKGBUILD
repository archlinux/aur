# Maintainer: Martin Kröner <aur@kroner.dev>
pkgname=iwqr
pkgver=0.1.0
pkgrel=1
pkgdesc='QR code generator for networks saved using iwd'
url='https://gitlab.com/krenyy/iwqr'
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/krenyy/iwqr/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('iwd')
sha256sums=('36afc6a5b3371c2d64116314e71c0fd5d7630ebab0f70b96ad2556d3a22c6a5b')

build() {
	cd "$srcdir/$pkgname-v$pkgver"

	cargo build --locked --release
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"

	install -Dm755 target/release/iwqr "${pkgdir}/usr/bin/iwqr"
}
