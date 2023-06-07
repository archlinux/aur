# Maintainer: Damien Deville <damien@ddeville.me>

pkgname=jl
pkgver=1.5.0
pkgrel=1
pkgdesc="JSON Logs, a development tool for working with structured JSON logging"
arch=("x86_64")
url="https://github.com/koenbollen/jl"
license=("ISC")
makedepends=("go")
depends=()

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("166322b4f7bda54466b0f9d306deaa801b723991db27839f1576b01f23b89e68")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GOFLAGS="-trimpath" go build
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/jl" "$pkgdir/usr/bin/jl"
}
