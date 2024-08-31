# Maintainer: Ice Layer <ice1ay3r@gmail.com>
pkgname="cwe-client-cli"
pkgver=0.3.2
pkgrel=1
pkgdesc="Simple console client for CWE"
arch=("x86_64")
license=("GPL")
makedepends=("cargo" "rust>=1.78")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NotBalds/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(25ae72c776a545d54a34693b7956ad7f7dafa7d9551b5ef301a5095e1ab5ae6f)  

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
