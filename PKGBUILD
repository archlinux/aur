# Maintainer: Evans Jahja <evansjahja13 gmail>
pkgname=rm-improved
pkgver=0.12.0
pkgrel=1
pkgdesc="Rm ImProved (rip) is a command-line deletion tool focused on safety, ergonomics, and performance. Use it as a safer alternative to rm."
arch=('x86_64')
url="https://github.com/nivekuil/rip"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
# changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/nivekuil/rip/archive/$pkgver.tar.gz")
noextract=()
sha256sums=("895a658c6362026c46f54059e129fba362cf0a1385e8a7b974ac8adabcfcdd64")
# validpgpkeys=()

#prepare() {
#	cd "rip-$pkgver"
#}

build() {
	cd "rip-$pkgver"
	cargo build --release --locked
}

check() {
	cd "rip-$pkgver"
	cargo test --release --locked
}

package() {
	cd rip-$pkgver/target/release
	mkdir -p $pkgdir/usr/bin/
	cp rip $pkgdir/usr/bin/$pkgname
	ln -rs $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/rip
}
