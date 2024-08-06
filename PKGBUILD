# Maintainer: Ice Layer <ice1ay3r@gmail.com>
pkgname="cwe-client-cli"
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple console client for CWE"
arch=("x86_64")
license=("GPL")
makedepends=("cargo" "rust>=1.78")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NotBalds/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(02944ebfac553b5058d846c3e49aa94cee2b579a308fe677902352cc0165ce4a)  

build() {
	cd "$pkgname-$pkgver"

	export CARGO_TARGET_DIR=target
	cargo build --release
}

check() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
