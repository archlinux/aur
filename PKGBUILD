# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.32.0
pkgrel=1
pkgdesc="Command Line Tool for Mackerel"
arch=('i686' 'x86_64')
url="https://github.com/mackerelio/mkr"
license=('APACHE')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mackerelio/mkr/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go get -t -d -v
  go build .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  go test -x -v .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 mkr-$pkgver "$pkgdir/usr/bin/mkr"
}

sha512sums=('f60e2397c972c52c361258de740273433f6eb31844191b1b3260672954c9ca65b1a2f3180124e19e558d498be0ccc073e9ecc4e808f7f345f03f425d5eac074e')

# vim: set et sw=2 sts=2:
