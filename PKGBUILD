# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=gorun
pkgver=19
pkgrel=3
pkgdesc="Program to run Go programs as if they were scripts"
arch=('x86_64' 'i686')
url="https://wiki.ubuntu.com/gorun"
license=('GPL3')
makedepends=('go')
options=(!strip)
source=("git+https://github.com/erning/gorun")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  GO111MODULE=off go build -o $pkgname
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
