# Maintainer: Raimar Bühmann <raimar_at_buehmann dot de>

pkgname=berry-lang
pkgver=1.1.0
pkgrel=1
pkgdesc='Ultra-lightweight dynamically typed scripting language for embedded systems.'
url='https://github.com/berry-lang/berry'
license=('MIT')
arch=(i686 x86_64)
dependencies=(
	'readline'
)
source=(
	"$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('b8eb94a44378ecd2f281cf7e244b8617b99f51d500638622b6126e60e730a693')
build() {
	cd "$srcdir/${pkgname/-lang}-$pkgver"
	make
}
package() {
	cd "$srcdir/${pkgname/-lang}-$pkgver"
	install -Dm755 berry $pkgdir/usr/bin/berry
}
