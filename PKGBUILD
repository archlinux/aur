# Maintainer: Gurkenwerfer <stefan@gurk.dev>
pkgname='gurkpad'
pkgver=v0.1.1
pkgrel=2
pkgdesc="Lightweight text editor written in C."
arch=('x86_64')
url="https://github.com/stefexec/gurkpad"
license=('GPL')
makedepends=('git')
provides=('gpad')
conflicts=('gpad')
_tag=b218779ee66e3f494101cdb2dfef37367a18f988
source=("git+https://github.com/stefexec/gurkpad.git#tag=$_tag")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 gurkpad "$pkgdir/usr/bin/gpad"
}
