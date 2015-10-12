# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=golinx
pkgver=12.e06b6e8
pkgrel=1
pkgdesc="A client for linx-server written in Go"
url="https://github.com/mutantmonkey/golinx"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'go')
source=("git+https://github.com/mutantmonkey/golinx.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  GOPATH="$srcdir" go get -v -d
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 golinx "${pkgdir}/usr/bin/golinx"
}

# vim:set ts=2 sw=2 et:
