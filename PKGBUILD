# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=2.3.0
pkgrel=1
pkgdesc="A CLI utility to list recently installed packages with filtering, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
depends=("expac")
source=("https://github.com/Zweih/yaylog/releases/download/v$pkgver/yaylog-$pkgver.tar.gz")
sha256sums=("b67362ef1adca368a58d5940d5c44f71f25402eea16b211d48dd752dc02d342d")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -o "$pkgname" ./cmd/$pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}