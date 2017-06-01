# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.3
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://github.com/freijon/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://github.com/freijon/mpvc-rs/archive/v${pkgver}.tar.gz")
sha512sums=('0b2695fc03b0195d7dc5543ab45ad85e0138e8721149252297f294cd1cd62aa18797e3975222ddcf4f468b95b77f49245eff405379d70ba1cb29eb8c1752933a')
provides=('mpvc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/mpvc $pkgdir/usr/bin/mpvc
}
