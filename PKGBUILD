# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=wit-bindgen
pkgver=0.13.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgname-cli-$pkgver.tar.gz")
sha256sums=("9f7a01d8eca95d1a34366d121c6b0c95caaeaaa8b95cec0160bbcce21f53da79")

build() {
	cd "$pkgname-$pkgname-cli-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgname-cli-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

