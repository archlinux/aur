# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-geiger
pkgver=0.11.1
pkgrel=1
pkgdesc="Detects usage of unsafe Rust in a Rust crate and its dependencies"
arch=('x86_64' 'x86')
url="https://crates.io/crates/cargo-geiger"
license=('MIT' 'Apache')
depends=('openssl' 'curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-secure-code/cargo-geiger/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('d3c88fc3bdb574108504a1a49ae7b8ee5b55b1744a47d58214d0f088d2b2ef00')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/cargo-geiger
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" cargo-geiger/LICENSE-*
}
