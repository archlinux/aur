# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=cargo-generate
pkgver=0.5.0
pkgrel=1
pkgdesc='Use pre-existing git repositories as templates'
arch=('i686' 'x86_64')
url="https://github.com/ashleygwilliams/$pkgname"
license=('APACHE' 'MIT')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashleygwilliams/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c44dc534651d531ffdf0ad4c4e2cba2b966a057aca88827ef6938957ba3800fc')

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
