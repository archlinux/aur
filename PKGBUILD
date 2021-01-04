# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-expand
pkgver=1.0.4
pkgrel=1
pkgdesc='Subcommand to show result of macro expansion and `#[derive]` expansion'
arch=(i686 x86_64)
url='https://github.com/dtolnay/cargo-expand'
license=(APACHE MIT)
depends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dtolnay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a1f5b53cb39990fae27079c0524516e385cd856663cca09c7a6a854ce35ed90f')

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
