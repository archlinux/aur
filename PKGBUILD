# Maintainer: Josh Wright <wright.jjw@gmail.com>
pkgname=dndtools
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Various CLI tools and Rust library for D&D 5e"
arch=('x86_64')
url="https://github.com/wrightjjw/dndtools"
license=('GPL3')
depends=()
makedepends=('cargo')
checkdepends=('cargo')
optdepends=()
provides=('stats'
	  'roll')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("303c0239f4790cfbea1526189e05cfc7bca0938db560e8922460c74217e97d1a")

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/stats $pkgdir/usr/bin/stats
	install -Dm755 target/release/roll $pkgdir/usr/bin/roll
}
