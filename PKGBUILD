# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
repname=mpvc
pkgver=1.1.3
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/mpv-ipc/mpvc/-/archive/v${pkgver}/mpvc-v${pkgver}.tar.gz")
sha512sums=('17c9f9d51390149b60d0716cd04e89cb728a2fd017c6035a2e519b0f40936a7afddb14e045c87e74d2955fed928aae8566d650342183dc54c3d151582505ef7e')
provides=('mpvc')

build() {
	cd $srcdir/$repname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$repname-v$pkgver*/target/release/mpvc $pkgdir/usr/bin/mpvc
}
