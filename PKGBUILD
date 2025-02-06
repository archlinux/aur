# Maintainer: Harry McKenzie <harry@copy.rest>
pkgname=asciigen
pkgver=1.0.6
pkgrel=12
pkgdesc="Converts images/video to ASCII art"
arch=('x86_64')
url="https://github.com/seatedro/asciigen"
license=('MIT')
depends=('ffmpeg')
makedepends=('zig')
source=("v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14decc7e70b8941f1635eef0192d38b617ea1942a05320b2d987c97d66fca1f9')

build() {
  cd "$pkgname-$pkgver"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "zig-out/bin/$pkgname"
}
