# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=peaclock
pkgver=0.1.7
pkgrel=1
pkgdesc="A colourful binary clock for the terminal"
arch=('x86_64')
url="https://github.com/octobanana/peaclock"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('dd8a8746f8f0f0eb5690d10d13a61b55e6b11c78e98637879b6140c9ad058a65')

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
