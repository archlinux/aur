# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=zlint
pkgver=0.10.0
pkgrel=1
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/DonIsaac/zlint
license=(MIT)
makedepends=('zig>=0.16.0' 'zig<0.17.0')
source=(https://github.com/DonIsaac/zlint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(bd5975933615483f2f7cd108ce8c9143c038a614d989f0237e535d7d54c4e966)

build() {
  cd $pkgname-$pkgver
  zig build --release=safe -Dversion="v$pkgver"
}

package() {
  install -Dm755 $pkgname-$pkgver/zig-out/bin/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
