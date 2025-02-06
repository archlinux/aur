# Maintainer: Harry McKenzie <harry@copy.rest>
pkgname=asciigen
pkgver=1.0.6
pkgrel=8
pkgdesc="Converts images/video to ASCII art"
arch=('x86_64')
url="https://github.com/seatedro/asciigen"
license=('MIT')
depends=('ffmpeg')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23c256647c0cfbf479bfa349972ceec03537c7da9e0626ff1f7f6dcaf6943ffe')

build() {
  cd "$pkgname-$pkgver"
  zig build -Drelease
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "zig-out/bin/$pkgname"
}
