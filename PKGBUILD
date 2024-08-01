# Maintainer: El Bachir <bachiralfa@gmail.com>
#
pkgname=gols
pkgver=1.2.1
pkgrel=1
pkgdesc="ls with colors written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gols"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gols/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17ffd9b7b3829424a31659b755c752a342bd3aeb034b344a184c615cde00ff6f') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export GO111MODULE=on
  go build -o gols
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gols "$pkgdir/usr/bin/gols"
}
