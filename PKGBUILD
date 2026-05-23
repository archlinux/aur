# Maintainer: kurojs <kuro@kurojs.com>
pkgname=jotoba-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="Japanese dictionary TUI powered by the Jotoba API — word, kanji, and sentence search"
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
