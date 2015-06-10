# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=gorun
pkgver=19
pkgrel=2
pkgdesc="Program to run Go programs as if they were scripts"
arch=('x86_64' 'i686')
url="http://launchpad.net/gorun/"
license=('GPL3')
makedepends=('go')
options=(!strip)
source=("http://bazaar.launchpad.net/~niemeyer/gorun/trunk/download/head:/gorun.go-20110311220116-kde0kha0feljz1pm-3/gorun.go")
sha256sums=('a5655571c1e89c267e14ce8f6944f9f4e88e13ecef7783c8a9b4eb21f94bd4cf')

build() {
  cd "$srcdir"

  go build -o $pkgname
}

package() {
  cd "$srcdir"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
