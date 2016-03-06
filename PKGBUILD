# Maintainer: Jarrod Moore <Jarrod@allforscience.com>
# 

pkgname="satellite"
pkgver=v0.4.0
pkgrel=1
pkgdesc="Satellite Program to fetch images from Himawari or Discovr and set them as desktop."
arch=('x86_64' 'i686')
url="https://github.com/avinashbot/satellite"
license=('MIT')
makedepends=('go')
options=('!strip')


prepare() {
  mkdir -p go
  export GOPATH="$srcdir/go"
  go get github.com/avinashbot/satellite
}

build() {
  export GOPATH="$srcdir/go"

  msg2 "Building satellite"
  go build "github.com/avinashbot/satellite"
}


package() {
  cd "$srcdir"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

}

# vim:set ts=2 sw=2 et:

