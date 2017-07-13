# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.5
pkgrel=2
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://github.com/freijon/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/freijon/mpvc-rs/repository/archive.tar.gz?ref=v${pkgver}")
sha512sums=('ccefe63a77cab8c656610fddbf63917633068b025d6ebe5f941503a69115d5fb5148efad6d488a7abef9ad51d2bf72add3b2007956851b84422d4a7a6e33196f')
provides=('mpvc')

build() {
	cd $srcdir/$pkgname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/mpvc $pkgdir/usr/bin/mpvc
}
