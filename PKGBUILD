# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.62.3
pkgrel=1
pkgdesc="Command Line Tool for Mackerel"
arch=('i686' 'x86_64' 'aarch64')
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

sha512sums=('eb48eba14321812a7a2edd794ea5c00b1a63000d934fe76a9e19c00b842ae2ab4c43437a2f5d0fdbe338932c77c2216cbce6464d5c9e61d58ea3b9eb40c7a878')

# vim: set et sw=2 sts=2:
