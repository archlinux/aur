# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.61.0
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

sha512sums=('80d48aef13104a6fa4de0ee6b8967fd54208301d2a1b5aa58e66a883606376fda3e905139cfc7c929fa600fc0b3c4524c2b1fcb437ed28c17143fabf7762c8a0')

# vim: set et sw=2 sts=2:
