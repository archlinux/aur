# Maintainer: Nev Delap <nevdelap@gmail.com>
pkgname="ned"
pkgver="1.2.5"
pkgrel=1
epoch=
pkgdesc="Is like grep, but with powerful replace capabilities, and more powerful than sed, as it isn't restricted to line oriented editing."
arch=("x86_64" "i686")
url="https://github.com/nevdelap/ned"
license=("GPL3")
groups=()
depends=()
makedepends=("rust")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/nevdelap/ned/archive/release.$pkgver.tar.gz")
noextract=()
md5sums=('9300b3df3c2f7637e577f0bfb0bb4097')
validpgpkeys=()

build() {
	cd "ned-release.$pkgver"
	cargo build --release
}

check() {
	cd "ned-release.$pkgver"
	cargo test --release
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "ned-release.$pkgver/target/release/ned" "$pkgdir/usr/bin"
	strip "$pkgdir/usr/bin/ned"
}
