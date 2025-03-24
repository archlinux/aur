# Maintainer: timescam <timescam at duck dot com>
# Contributor: Crestwave <crest.wave@yahoo.com>

pkgname=peaclock
pkgver=0.4.3
pkgrel=2
pkgdesc="A colourful binary clock for the terminal"
arch=('x86_64')
url="https://github.com/octobanana/peaclock"
license=('MIT')
makedepends=('cmake')
depends=('icu')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('3de32486e45ddf6a62c591619b5373d23c8eaf885975441ae581ca7241c48012')

build() {
  cd "$pkgname-$pkgver"
  ./RUNME.sh build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/release/peaclock -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
