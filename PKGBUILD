# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.3
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config rust)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6b2c239390024f5f5dfebd2c8a8089acbebc81b6addfe3af68153064e5e36612')

build() {
    cd $srcdir/$pkgname-$pkgver
    cargo build --release
}

package() {
    install -Dm 775 $srcdir/$pkgname-$pkgver/target/release/camilladsp -t $pkgdir/usr/bin
}
