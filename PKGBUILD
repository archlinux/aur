# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.49.3
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

sha512sums=('caa1edf43e7f400ad50d1cc58592388371df97afdf12c72bdca04ad22b08561f44bf9230439ffd3c1baa30c42eec9597a0ca20a856846e6e2ac2813f5e0d57ce')

# vim: set et sw=2 sts=2:
