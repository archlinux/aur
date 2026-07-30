# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=zlint
pkgver=0.9.1
pkgrel=1
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/DonIsaac/zlint
license=(MIT)
makedepends=('zig>=0.16.0' 'zig<0.17.0')
source=(https://github.com/DonIsaac/zlint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(867538996fa697d3fe797cb5b9559b37674c3d065091df373cee76c1052ff1a4)

build() {
  cd $pkgname-$pkgver
  zig build --release=safe
}

package() {
  install -Dm755 $pkgname-$pkgver/zig-out/bin/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
