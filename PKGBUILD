# Maintainer: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=mkr
pkgver=0.60.0
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

sha512sums=('170362b5ea471de832a314cdd8b55b794e4ab91b55fb0c2412bb530091a73cd9bcf03a962d1a5bd2b47ed1c13141ca3217278f469c7c2990e4d8648407d6c3f2')

# vim: set et sw=2 sts=2:
