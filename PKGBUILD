# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=talktoniall
pkgver=0.1
pkgrel=1
pkgdesc='Talk to Niall (a bit like a chatbot)'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/talktoniall'
license=('GPL2')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("git://github.com/xyproto/talktoniall#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

  GOPATH="$srcdir" go get -d
}

build() {
  cd "$pkgname"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
