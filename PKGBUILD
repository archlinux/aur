# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=grc-rs
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="Generic Colouriser (grc) ported to Rust"
arch=('x86_64')
url="https://github.com/larsch/grc-rs"
license=('MIT')
groups=()
depends=('grc')
makedepends=('rust' 'cargo' 'make')
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
sha256sums=('62b0b52d8910e5d7b41349390523c1ad59ef7f980002971907e0e3849b68c12f')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
	make grc-rs.1.gz
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}
