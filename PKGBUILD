# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=grc-rs
pkgver=0.1.2
pkgrel=1
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
sha256sums=('583c372966dfbabc41dd23569b0e301e2ae8ac5016b56667176cfceaad2dceb6')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 0755 target/release/grc-rs $pkgdir/usr/bin/grc-rs
	install -D -m 0644 README.md $pkgdir/usr/share/doc/grc-rs/README.md
}
