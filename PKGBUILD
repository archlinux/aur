# $Id: PKGBUILD 110816 2014-05-07 16:32:16Z arodseth $
# Maintainer: Alexander Rødseth <xyproto@archlinux.org>

pkgname=http2check
pkgver=0.4
pkgrel=1
pkgdesc='Utility for checking if a given webserver supports HTTP/2'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/http2check/'
license=('MIT')
makedepends=('go' 'git')
source=("git://github.com/xyproto/http2check.git#tag=$pkgver")
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
