# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.28.0
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

sha512sums=('8a61129d0394c6bd350da0762e8b60b73152b314b5f29efbbea6939679ad14482dfd373e301c6440ae58921ac1acfda3fdcb62d2ae5e491ddc3f60314e31c024')

# vim: set et sw=2 sts=2:
