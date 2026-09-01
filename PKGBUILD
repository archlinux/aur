# Maintainer: rokuroo171 <mrakkakhairilazwar@gmail.com>
pkgname=raind
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal weather screensaver with four modes: rain, thunder, snow, meteor"
arch=('x86_64' 'aarch64')
url="https://github.com/rokuroo171/raind"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rokuroo171/raind/archive/v$pkgver.tar.gz")
sha256sums=('11ebf767150c6d3fd4d2b5376dfc651bbaab66087b7ddcc6998fd74f44e180f3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CGO_ENABLED=0 go build -trimpath -o raind .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 raind "$pkgdir/usr/bin/raind"
  install -Dm644 README.md "$pkgdir/usr/share/doc/raind/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}