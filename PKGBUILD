# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
repname=mpvc
pkgver=1.0.7
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/mpvc"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/mpv-ipc/mpvc/repository/archive.tar.gz?ref=v${pkgver}")
sha512sums=('a94ad3479abb57cfada9c5d42dfadff038d59cce2e5d64c229f7a8c42b7c50ff38fdb89215e3f65bd66da83fb17aec1a396cefc5d8b877cde2abc007b46db4e9')
provides=('mpvc')

build() {
	cd $srcdir/$repname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$repname-v$pkgver*/target/release/mpvc $pkgdir/usr/bin/mpvc
}
