# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=persway
pkgver=0.4.1
pkgrel=1
pkgdesc="Small Sway IPC Daemon"
url="https://github.com/johnae/persway"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johnae/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('86c1fe7ee9b378a45d69acf9f0836d83aefcdd281cc4c8d9cae12afcac9baeefe6d71f40e34709d85b5204e15d86f652c52010370c4636705fcca6c9f1b0a9bc')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

