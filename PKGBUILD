# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.29.0
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

sha512sums=('8144963edf145ad1cdaa3401587b943c3334eb92962adaa02aa4571aa5729006fd3ce68af19a9a8376036016c39f882df8fa303986a0619c9519aa824f86f9c6')

# vim: set et sw=2 sts=2:
