# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.35.1
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
  export PATH="$PATH:$GOPATH/bin"
  make build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/build"
  export PATH="$PATH:$GOPATH/bin"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 mkr "$pkgdir/usr/bin/mkr"
}

sha512sums=('dc4784d73db373399e27b74660132a70a867906d89c19471b76b335b8014a599260ea490b225a060570b054cd7f9a213e4fb87c13dd9fe94b9bca0797054e589')

# vim: set et sw=2 sts=2:
