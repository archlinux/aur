# Maintainer: Nev Delap <nevdelap at gmail dot com>
pkgname="ned"
pkgver="1.2.5"
pkgrel=1
pkgdesc="Is like grep, but with powerful replace capabilities, and more powerful than sed, as it isn't restricted to line oriented editing."
arch=("x86_64")
url="https://github.com/nevdelap/ned"
license=("GPL3")
depends=("gcc-libs")
makedepends=("rust")
source=("https://github.com/nevdelap/ned/archive/release.$pkgver.tar.gz")
md5sums=('9300b3df3c2f7637e577f0bfb0bb4097')

build() {
	cd "ned-release.$pkgver"
	cargo build --release --locked
}

check() {
	cd "ned-release.$pkgver"
	cargo test --release --locked
}

package() {
	install -d "$pkgdir/usr/bin"
	install -s "ned-release.$pkgver/target/release/ned" "$pkgdir/usr/bin/ned"
}
