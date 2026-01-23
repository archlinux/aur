# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=zlint
pkgver=0.7.9
pkgrel=2
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/DonIsaac/zlint
license=(MIT)
makedepends=('zig>=0.14.0' 'zig<0.15.0')
source=(https://github.com/DonIsaac/zlint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(be81fd5d9dd7cafc65c1214946c05b629d1ceb3ada31add96bfd260efea2e2fc)

build() {
  cd $pkgname-$pkgver
  zig build --release=safe
}

package() {
  install -Dm755 $pkgname-$pkgver/zig-out/bin/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
