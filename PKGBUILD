# Maintainer: El Bachir <bachiralfa@gmail.com>
pkgname=gt
pkgver=1.3.1
pkgrel=1
pkgdesc="A tree-like command-line tool written in Go"
arch=('x86_64')
url="https://github.com/elbachir-one/gt"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbachir-one/gt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7cf8c8579b960f60c9c5809f3c962a0a78972029e1a387109c1fc5052095d878') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export GOPATH="$srcdir/go"
  export GO111MODULE=on
  go build -o gt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gt "$pkgdir/usr/bin/gt"
  install -Dm644 gt.1 "$pkgdir"/usr/share/man/man1/gt.1
}
