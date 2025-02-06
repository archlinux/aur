# Maintainer: Fernando Nunez <me@fernandonunez.io>
pkgname=yaylog
pkgver=2.4.0
pkgrel=1
pkgdesc="A CLI utility to list recently installed packages with filtering, written in Go."
arch=("any")
url="https://github.com/Zweih/yaylog"
license=("MIT")
makedepends=("go")
depends=("expac")
source=("https://github.com/Zweih/yaylog/releases/download/v$pkgver/yaylog-$pkgver.tar.gz")
sha256sums=("af8851b18b696591d4123fb9faf8ee667aa200e7ee098f9c0b8a510f2214586d")

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