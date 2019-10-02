# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.39.2
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

sha512sums=('e1517cb5657df09340b1536cf36d7d6fa24b0ebb795c829ea4e37a1fa155b6795d3faba26366d9b155d12b2c3d81f3dc3b9bf5a006a63b38c26670c783b05dea')

# vim: set et sw=2 sts=2:
