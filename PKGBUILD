# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=zlint
pkgver=0.9.0
pkgrel=0
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/DonIsaac/zlint
license=(MIT)
makedepends=('zig>=0.16.0' 'zig<0.17.0')
source=(https://github.com/DonIsaac/zlint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(69c8084740fc1ec3cc2f2fc4c9fa8cdbbc73f390bb13467e924eba2ed2351f48)

build() {
  cd $pkgname-$pkgver
  zig build --release=safe
}

package() {
  install -Dm755 $pkgname-$pkgver/zig-out/bin/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
