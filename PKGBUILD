# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=wit-bindgen
pkgver=0.17.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgname-cli-$pkgver.tar.gz")
sha256sums=("3fb88521281523c04e6189df6651d9d203327986b37a23163fb2d0a506aac7b4")

build() {
	cd "$pkgname-$pkgname-cli-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgname-cli-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

