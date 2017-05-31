# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.2
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://github.com/freijon/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://github.com/freijon/mpvc-rs/archive/v${pkgver}.tar.gz")
sha512sums=('346853d1e20923b34b2bad3a567b9e870a3b41b9303df2f7810d99bc98532c7de8f6ffd60edafdf1dc95d04aa30aa890d4ce94cb8675afa3a69db133a8609e25')
provides=('mpvc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/mpvc $pkgdir/usr/bin/mpvc
}
