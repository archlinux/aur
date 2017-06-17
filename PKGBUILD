# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.5
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://github.com/freijon/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://github.com/freijon/mpvc-rs/archive/v${pkgver}.tar.gz")
sha512sums=('252b185e0610d12d0ce7080e45f3687e8c19399d5cdb93920ad5ce1d53f36bbadc2dd5e93a224cf2f3742f080fec081569bf42403629d9f557f657f4413efd2f')
provides=('mpvc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/mpvc $pkgdir/usr/bin/mpvc
}
