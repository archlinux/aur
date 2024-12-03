# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-tools
pkgver=1.221.2
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9940c19aa878f500a031282f13401fb6177517a238220246bbcea0d642ee8934')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

