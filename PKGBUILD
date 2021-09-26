# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=grc-rs
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="Generic Colouriser (grc) ported to Rust"
arch=('x86_64')
url="https://github.com/larsch/grc-rs"
license=('MIT')
groups=()
depends=('grc')
makedepends=('rust' 'cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/larsch/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8736269ac826dade4491307ba4fda51604778df8ca1df08b9916541492964901')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/grc-rs $pkgdir/usr/bin/grc-rs
}
