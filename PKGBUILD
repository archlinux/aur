# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=cargo-generate
pkgver=0.5.1
pkgrel=1
pkgdesc='Use pre-existing git repositories as templates'
arch=('i686' 'x86_64')
url="https://github.com/ashleygwilliams/$pkgname"
license=('APACHE' 'MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashleygwilliams/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1146dd9dfa9a4d7bb94a2be105f452e3f89e609a88ae87d7de39f5da943467d6')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
