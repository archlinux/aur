# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=peaclock
pkgver=0.4.0
pkgrel=1
pkgdesc="A colourful binary clock for the terminal"
arch=('x86_64')
url="https://github.com/octobanana/peaclock"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('3b14608b2e507e268b1804c2383cbde241886eeba8d313d646524a44e3ab8615')

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
