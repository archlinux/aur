# Maintainer: El Bachir <bachiralfa@gmail.com>
pkgname=gt
pkgver=0.3.1
pkgrel=1
pkgdesc="A tree-like command-line tool written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gt"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('467efe7c6087805b6b818f0623f4edbd02a46e4f1c2b359993fb0efbc51c5e0a') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export GO111MODULE=on
  go build -o gt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gt "$pkgdir/usr/bin/gt"
}
