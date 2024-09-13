# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>

pkgname=wasm-tools
pkgver=1.217.0
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("69fde3c83e307c18d7bad46e1ceccdd1d8dcf9fd51392a313ea20cc4c69826b7")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

