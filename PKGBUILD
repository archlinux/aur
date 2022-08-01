# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-geiger
pkgver=0.11.4
pkgrel=1
pkgdesc="Detects usage of unsafe Rust in a Rust crate and its dependencies"
arch=('x86_64' 'x86')
url="https://crates.io/crates/cargo-geiger"
license=('MIT' 'Apache')
depends=('openssl' 'curl' 'libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-secure-code/cargo-geiger/archive/geiger-$pkgver.tar.gz")
sha256sums=('93dc12ce01a5b15001736fb0b74600e17a2e80c7e9620bd7b9ad6a615f6dcd00')


build() {
	cd "$pkgname-geiger-$pkgver/cargo-geiger"
	cargo build --release --locked
}

package() {
	cd "$pkgname-geiger-$pkgver"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/cargo-geiger
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" cargo-geiger/LICENSE-*
}
