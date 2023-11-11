# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=wit-bindgen
pkgver=0.14.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache")
depends=("glibc" "gcc-libs")
makedepends=("rust" "cargo")
source=("https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgname-cli-$pkgver.tar.gz")
sha256sums=("d49623bc07981631ea158e1f88b1cde887c153aac262d077f3726503d42c651a")

build() {
	cd "$pkgname-$pkgname-cli-$pkgver"
	cargo build --release
}

package() {
	install -Dm755 "$pkgname-$pkgname-cli-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

