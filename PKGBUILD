# Maintainer: Evans Jahja <evansjahja13 gmail>
pkgname=rm-improved
pkgver=0.14.0
pkgrel=2
pkgdesc="Rm ImProved (rip) is a command-line deletion tool focused on safety, ergonomics, and performance. Use it as a safer alternative to rm."
arch=('x86_64')
url="https://github.com/StandingPadAnimations/rip"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=('rip')
replaces=()
backup=()
options=()
# changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/StandingPadAnimations/rip/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('a00ddc86dc86b15302a6d1660dd1d7058a9e2cc5c24ac6c0cfd3345a0aad4854')
# validpgpkeys=()

#prepare() {
#	cd "rip-$pkgver"
#}

build() {
	cd "rip-$pkgver"
	cargo build --release
}

check() {
	cd "rip-$pkgver"
	cargo test --release
}

package() {
	cd rip-$pkgver/target/release
	mkdir -p $pkgdir/usr/bin/
	cp rip $pkgdir/usr/bin/$pkgname
	ln -rs $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/rip
}
