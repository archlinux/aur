# Maintainer: Stefan Kupych <stefan@kupy.ch>
#
pkgname=rapid-git
pkgver=v0.0.3.r09e3703a
pkgrel=1
pkgdesc="Rapid API Dialogue - A REPL for APIs"
arch=('x86_64')
url="https://github.com/kupych/rapid"
license=('MIT')
makedepends=('go')
source=("git+https://github.com/kupych/rapid.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rapid"
  git describe --long --tags | sed 's/\([^-]*\)-g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/rapid"
  go build -o rapid
}

package() {
  cd "$srcdir/rapid"
  install -Dm755 rapid "$pkgdir/usr/bin/rapid"
}
