# Maintainer: Nev Delap <nevdelap at gmail dot com>
pkgname="ned"
pkgver="1.2.7"
pkgrel=1
pkgdesc="Like grep but with a powerful replace, unlike sed, it's not only line oriented."
arch=("x86_64")
url="https://github.com/nevdelap/ned"
license=("GPL3")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nevdelap/ned/archive/release.$pkgver.tar.gz")
md5sums=('b9e85861abb59ee342ad195263c1964b')

build() {
	cd "ned-release.$pkgver"
	cargo build --release --locked
}

check() {
	cd "ned-release.$pkgver"
	cargo test --release --locked
}

package() {
	install -Dm755 "ned-release.$pkgver/target/release/ned" "$pkgdir/usr/bin/ned"
}
