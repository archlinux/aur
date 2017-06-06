# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=mpvc-rs
pkgver=1.0.4
pkgrel=1
pkgdesc="An mpc-like cli tool for mpv which connects to existing mpv instances through sockets, written in Rust"
arch=('x86_64')
url="https://github.com/freijon/mpvc-rs"
license=('GPL3')
depends=('mpv')
makedepends=('cargo')
source=("mpvc-${pkgver}.tar.gz::https://github.com/freijon/mpvc-rs/archive/v${pkgver}.tar.gz")
sha512sums=('7379bc10868a2eff72e939a24c4f122031835ab3760c12efc2bea0231fa1582b8ddc2dc2cefb5e1b8d72b37bc2eb7b249a17cdf70b0d3e359b9e98997528864e')
provides=('mpvc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/mpvc $pkgdir/usr/bin/mpvc
}
