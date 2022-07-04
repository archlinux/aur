# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
repname=mpvc
pkgver=1.0.9
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/mpv-ipc/mpvc/-/archive/v${pkgver}/mpvc-v${pkgver}.tar.gz")
sha512sums=('7b1770f836828a49bf80922dfdd96cf5e3dd98e3de9f7ae3493b87669ba89e6511cb7ca790b4c03c8786560bca80e8b729c898109501a2388530c572dce43620')
provides=('mpvc')

build() {
	cd $srcdir/$repname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$repname-v$pkgver*/target/release/mpvc $pkgdir/usr/bin/mpvc
}
