# Maintainer: El Bachir <bachiralfa@gmail.com>
#
pkgname=gols
pkgver=1.3.2
pkgrel=1
pkgdesc="ls with colors written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gols"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gols/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('804b7be1062ea9d5bffae34d6b51a8fbc062d5f972c6bdbc06ce56a09c158ede') 

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
