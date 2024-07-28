# Maintainer: El Bachir <bachiralfa@gmail.com>
pkgname=gt
pkgver=1.2.0
pkgrel=1
pkgdesc="A tree-like command-line tool written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gt"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('280d48d80b01ec23757ae032a74585d73433b41ad1601179e86a1e08699056eb') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export GO111MODULE=on
  go build -o gt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gt "$pkgdir/usr/bin/gt"
}
