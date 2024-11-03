# Maintainer: El Bachir <bachiralfa@gmail.com>
#
pkgname=gols
pkgver=1.4.5
pkgrel=1
pkgdesc="ls with colors written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gols"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gols/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bba56f9d1ca6d1b8fc15a7f0f832fa00a8b8ea41e176b39cc6d14adb39d9c996') 

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
