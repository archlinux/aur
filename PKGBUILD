# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://github.com/freijon/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://github.com/freijon/mpvc-rs/archive/${pkgver}.tar.gz")
sha512sums=('2cf827b5fae3a064dc8d039101e4d8f5df319140cf8ea9c2369cbf6aea337766326af7927b39466d1b91f9da9614e9a2d682bc9ab4ec4e155268ea574ff9842f')
provides=('mpvc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/mpvc $pkgdir/usr/bin/mpvc
}
