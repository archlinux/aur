# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-geiger
pkgver=0.11.4
pkgrel=2
pkgdesc="Detects usage of unsafe Rust in a Rust crate and its dependencies"
arch=('x86_64' 'x86')
url="https://crates.io/crates/cargo-geiger"
license=('MIT' 'Apache')
depends=('openssl' 'curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-secure-code/cargo-geiger/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('8f57da70a465c7fc2797b5142c51fd763e4569e0b3daf63205980be3a1af2576')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/cargo-geiger
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" cargo-geiger/LICENSE-*
}
