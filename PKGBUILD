# Maintainer: kurojs <kuro@kurojs.com>
pkgname=jotoba-tui
pkgver=1.1.0
pkgrel=4
pkgdesc="Japanese dictionary TUI — word, kanji, and sentence search with language selector"
arch=('x86_64')
url="https://github.com/kurojs/jotoba-tui"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o jotoba-tui ./cmd/jotoba
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 jotoba-tui "$pkgdir/usr/bin/jotoba"
}
