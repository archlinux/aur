# Maintainer: El Bachir <bachiralfa@gmail.com>
#
pkgname=gols
pkgver=1.4.4
pkgrel=1
pkgdesc="ls with colors written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gols"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gols/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4325aa1cce4fdeeb896846078ad451b20e132191fc2b760a1412661f6a64db9a') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export GO111MODULE=on
  go build -o gols
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gols "$pkgdir/usr/bin/gols"
  install -Dm644 gols.1 "$pkgdir/usr/share/man/man1/gols.1"
}
