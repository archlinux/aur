# Maintainer: Damien Deville <damien@ddeville.me>

pkgname=jl
pkgver=1.6.0
pkgrel=1
pkgdesc="JSON Logs, a development tool for working with structured JSON logging"
arch=("x86_64")
url="https://github.com/koenbollen/jl"
license=("ISC")
makedepends=("go")
depends=()

source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("91d01ace8795f156a84d0d0294451ba5d9b5a3ee2b00cb27852cf901657fc115")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  GOFLAGS="-trimpath" go build
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/jl" "$pkgdir/usr/bin/jl"
}
