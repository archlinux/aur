# Maintainer: Lars Christensen <larsch@belunktum.dk>
pkgname=grc-rs
pkgver=0.3.2
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
sha256sums=('f6d4f8bc8f75e0654f7562d75ca0e7f671666b31bc4d07921c7edf0d6fc93866')
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
