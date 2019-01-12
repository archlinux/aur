# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=peaclock
pkgver=0.1.3
pkgrel=1
pkgdesc="A colourful binary clock for the terminal"
arch=('x86_64')
url="https://github.com/octobanana/peaclock"
license=('MIT')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('0041de0e50429786dff4152c60f6dbd84249287d289ad6d7573e47c9f9b62afc')

build() {
  cd "$pkgname-$pkgver"
  ./build.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/release/peaclock -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
