# Maintainer : Daniel Chesters <archlinux@coin-coin.xyz>

pkgname=i3wsr
pkgver=3.0.0
pkgrel=1
pkgdesc="A small program to change the name of an i3 workspace based on its contents."
url="https://github.com/roosta/i3wsr"
depends=('i3-wm')
makedepends=('cargo' 'python')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roosta/$pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('b42d4eb6c32d85c300823700a455408bb784f507479c01f00849b138b8249be64c7d28f17933cbf4f5013496dcafabd2a1365db5fb687ef0f6a52e3b5d69c88d')
