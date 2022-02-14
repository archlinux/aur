# $Id$
# Maintainer: Kemad Zhong <kemadz@gmail.com>

pkgname=tcping-git
pkgver=1.3.6
pkgrel=2
pkgdesc="a utility that does a TCP connect to the given ip/port combination"
url="https://github.com/mkirchner/tcping"
license=("MIT")
arch=('x86_64')
depends=('glibc')
source=("git+$url#tag=$pkgver")
sha512sums=('SKIP')
provides=("tcping")
conflicts=("tcping")
replaces=("tcping")

build() {
  cd "$srcdir/tcping"
  make
}

package() {
  install -Dm 755 "$srcdir/tcping/tcping" "$pkgdir/usr/bin/tcping"
}
