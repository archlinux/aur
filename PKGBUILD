# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=teaftp
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple, read-only TFTP server'
arch=(x86_64)
url='https://github.com/xyproto/teaftp'
license=(MIT)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  export GO111MODULE=off
  go get -d
  go build -buildmode=pie
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
