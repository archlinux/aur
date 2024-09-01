# Maintainer: Ice Layer <ice1ay3r@gmail.com>
pkgname="cwe-client-cli"
pkgver=0.3.2
pkgrel=2
pkgdesc="Simple console client for CWE"
arch=("x86_64")
license=("GPL")
makedepends=("cargo" "rust>=1.78")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NotBalds/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(02216b4648d336ec44a65fd865a535b9b1a687ea4d34cf7d532d557f445dabeb)  

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
