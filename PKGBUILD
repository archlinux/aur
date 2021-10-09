# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=grc-rs
pkgver=0.3.1
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
sha256sums=('1de3d2e1cf8028f1f0e50bc8745b4ea7356d3d5a3862518c9c8cb3d262b2d33f')
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
