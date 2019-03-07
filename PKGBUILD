# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=peaclock
pkgver=0.2.0
pkgrel=1
pkgdesc="A colourful binary clock for the terminal"
arch=('x86_64')
url="https://github.com/octobanana/peaclock"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e8b71e62b6f408a95bfd7f1381bb2cfe390969be37f7c2f83b60cd313cde8589')

build() {
  cd "$pkgname-$pkgver"
  ./build.sh --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/release/peaclock -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
