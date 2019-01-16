# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=peaclock
pkgver=0.1.6
pkgrel=1
pkgdesc="A colourful binary clock for the terminal"
arch=('x86_64')
url="https://github.com/octobanana/peaclock"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('0ba76ce15c3d8bb49656ccbae403a9b9619a219518fa60863853d0f863070779')

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
