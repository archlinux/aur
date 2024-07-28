# Maintainer: Martin Kröner <aur@kroner.dev>
pkgname=iwqr
pkgver=0.1.1
pkgrel=1
pkgdesc='QR code generator for networks saved using iwd'
url='https://gitlab.com/krenyy/iwqr'
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/krenyy/iwqr/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('iwd')
sha256sums=('ba15034e078b42d4f9acd24c6e9fb7efccc0015067ccc29f3ad8e058b89f2aa6')

build() {
	cd "$srcdir/$pkgname-v$pkgver"

	cargo build --locked --release
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"

	install -Dm755 target/release/iwqr "${pkgdir}/usr/bin/iwqr"
}
