# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-geiger
pkgver=0.11.2
pkgrel=1
pkgdesc="Detects usage of unsafe Rust in a Rust crate and its dependencies"
arch=('x86_64' 'x86')
url="https://crates.io/crates/cargo-geiger"
license=('MIT' 'Apache')
depends=('openssl' 'curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-secure-code/cargo-geiger/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('425638232f4c617a1dde1071f865c5140546bf9b6b61b9a9a186d0a5c146ac03')


build() {
	cd "$pkgname-$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/cargo-geiger
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" cargo-geiger/LICENSE-*
}
