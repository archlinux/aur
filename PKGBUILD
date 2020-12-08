# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-expand
pkgver=1.0.1
pkgrel=1
pkgdesc='Subcommand to show result of macro expansion and `#[derive]` expansion'
arch=(i686 x86_64)
url='https://github.com/dtolnay/cargo-expand'
license=(APACHE MIT)
depends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dtolnay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('c5ebd6e6a4ba69b837a068e141aedb96d3cbc9bd18421fa70407adce151ba6dd')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
