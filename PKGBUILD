# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-tools
pkgver=1.223.0
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bded9fb68df0fa14f80a37609c272c20a9f35b20c897b9900305ccaa3f93d6d2')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

