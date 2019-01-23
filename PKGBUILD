# Maintainer: Nev Delap <nevdelap at gmail dot com>
pkgname="ned"
pkgver="1.2.6"
pkgrel=1
pkgdesc="Like grep but with a powerful replace, unlike sed, it's not only line oriented."
arch=("x86_64")
url="https://github.com/nevdelap/ned"
license=("GPL3")
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nevdelap/ned/archive/release.$pkgver.tar.gz")
md5sums=('dcdd68a7abcd4622b8c7f26eff7e8b28')

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
