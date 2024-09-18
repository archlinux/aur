# Maintainer: Harry McKenzie <harry@copy.rest>
pkgname=asciigen
pkgver=1.0.4
pkgrel=2
pkgdesc="Converts images/video to ASCII art"
arch=('x86_64')
url="https://github.com/seatedro/asciigen"
license=('MIT')
depends=('ffmpeg')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2326d73376997f838bae25ebc7d1f6f84a7442db8f55ec841a7e11246b73c31f')

build() {
  cd "$pkgname-$pkgver"
  zig build -Drelease
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "zig-out/bin/$pkgname"
}
