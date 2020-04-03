# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.40.0
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

sha512sums=('e2b34e33d566ab79452f0efb75f56d9c1a2cbf290f9e1fe5a7d854ce68e6e312f7d6bc8d687707907b8b8a09234d4c683bb9a12821e833edf4797ea36881ec99')

# vim: set et sw=2 sts=2:
