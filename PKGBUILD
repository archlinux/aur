# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

pkgname=cargo-screeps
pkgver=0.5.2
pkgrel=1
pkgdesc="Build tool for deploying Rust WASM code to Screeps game servers"
url="https://github.com/rustyscreeps/cargo-screeps/"
license=("MIT")
arch=("x86_64")
makedepends=('git' 'cargo')
provides=("cargo-screeps")
conflicts=("cargo-screeps")
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyscreeps/cargo-screeps/archive/refs/tags/cargo-screeps-$pkgver.tar.gz")
sha256sums=('98a62c00f843af6f04ff6868a9e4c34d19747edd387b0f0951a3c94ad8b6986e')

build() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"

	CARGO_TARGET_DIR='target' cargo build --release
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/cargo-screeps" -t "$pkgdir/usr/bin"
}
