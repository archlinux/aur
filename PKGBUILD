# $Id$
# Maintainer: Kemad Zhong <kemadz@gmail.com>

pkgname=jsonfmt
pkgver=0.2.1
pkgrel=1
pkgdesc="Like gofmt, but for JSON files."
url="https://github.com/caarlos0/jsonfmt"
license=("LGPL")
arch=('x86_64')
depends=('git')
makedepends=('go')
source=("git+$url#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  CGO_ENABLED=0 go build --ldflags "-X main.version=$pkgver"
}

package() {
  install -Dm 755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
