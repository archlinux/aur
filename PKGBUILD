# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>

pkgname=wasm-tools
pkgver=1.213.0
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("d320b9b9d32e029d3ebb90911d8857bbd4edb80ab0072e4f69deaf0582204b03")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

