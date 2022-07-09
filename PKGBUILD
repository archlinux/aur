# Maintainer: Kolei Chen <chenkolei at gmail dot com>

pkgname=tncattach
pkgver=0.1.9
pkgrel=1
pkgdesc="Lightweight KISS TNC interface program"
url="https://unsigned.io/tncattach/"
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
depends=()
source=("https://github.com/markqvist/tncattach/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('aaa8572b2ac51b1dbf32b4023acb83c6c0334627644d5f33bc684c3cc6ba1bd09065e52c34586553d82e7a0538d164d8c8c2ab48bec5e16f99c3dea5129142f8')

build() {
	cd $srcdir/$pkgname-$pkgver
	make $MAKEFLAGS
	gzip -9 tncattach.8
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm 755 tncattach "$pkgdir/usr/bin/tncattach"
	install -Dm 755 tncattach.8.gz "$pkgdir/usr/share/man/man8/tncattach.8.gz"
}
