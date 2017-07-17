# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.6
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://gitlab.com/mpv-ipc/mpvc-rs/repository/archive.tar.gz?ref=v${pkgver}")
sha512sums=('2b50b68fc252f7c5cbe312cd5395e20f860df48e335f578092cc7899e09486bc2f1bf2d110809db4b9685f4aafd8a04d48aa4b7e879566d801d88b676c86d96a')
provides=('mpvc')

build() {
	cd $srcdir/$pkgname-v$pkgver*
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-v$pkgver*/target/release/mpvc $pkgdir/usr/bin/mpvc
}
