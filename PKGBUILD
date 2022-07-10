# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
repname=mpvc
pkgver=1.1.2
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/mpv-ipc/mpvc/-/archive/v${pkgver}/mpvc-v${pkgver}.tar.gz")
sha512sums=('b4cd530f27e747d192e3266095071bb666bbcc86c4c38bc6ce5fcc062dbe1ee676bdbd2057490c3f0fbf4e05704af14a7ef2ae722bc2b285347ef8f4219d2e29')
provides=('mpvc')

build() {
	cd $srcdir/$repname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$repname-v$pkgver*/target/release/mpvc $pkgdir/usr/bin/mpvc
}
