# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=zlint
pkgver=0.8.1
pkgrel=0
pkgdesc='A linter for the Zig programming language'
arch=(x86_64)
url=https://github.com/DonIsaac/zlint
license=(MIT)
makedepends=('zig>=0.15.0' 'zig<0.16.0')
source=(https://github.com/DonIsaac/zlint/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(bfa35fa2acc227e7a94f8b4602bfc83c5aab39d638fdfe56261c92259d5bd35b)

build() {
  cd $pkgname-$pkgver
  zig build --release=safe
}

package() {
  install -Dm755 $pkgname-$pkgver/zig-out/bin/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
