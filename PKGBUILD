# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
repname=mpvc
pkgver=1.1.0
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/mpv-ipc/mpvc/-/archive/v${pkgver}/mpvc-v${pkgver}.tar.gz")
sha512sums=('ab19968d3d72db8dc69cff761024f6eab047680521c354937d599b108e387d29453762764e4540881d621f02a629012a7d618fb57e2454433fdc2e1bb83b71bd')
provides=('mpvc')

build() {
	cd $srcdir/$repname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$repname-v$pkgver*/target/release/mpvc $pkgdir/usr/bin/mpvc
}
