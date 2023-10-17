# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=wit-bindgen
pkgver=0.12.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgname-cli-$pkgver.tar.gz")
sha256sums=("44206c2b610afff5f5688b404ae80a9146c16752cc77313a49c3fc733edfca51")

build() {
	cd "$pkgname-$pkgname-cli-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgname-cli-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

