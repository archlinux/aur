# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=0.6.3
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(cargo pkg-config)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9a108e202f6c4b30f05cb1d7702c0649a29c0f612d510346e5825c8e1fc9855f')
build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/target/release/camilladsp $pkgdir/usr/bin
}
