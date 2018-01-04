# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=blacksheepwall
pkgver=3.3.0
pkgrel=1
pkgdesc="A hostname reconnaissance tool"
arch=('x86_64')
url="https://github.com/tomsteele/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/tomsteele/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('201de98289060a15ef15a8f4f087be2e11a5585a8b7c7a764794624fa170a07f')
