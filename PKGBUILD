# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.51.1
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

sha512sums=('27fcc4e7c2cecd424f672aa3d87b5cdc58a2b473ddb4542fdf179123303854d52361455fa4ba5efdb9024562463a1492865c95b47f08dcbc53466695c18bc4be')

# vim: set et sw=2 sts=2:
