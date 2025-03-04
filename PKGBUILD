# Maintainer: Gurkenwerfer <stefan@gurk.dev>
pkgname='gurkpad'
pkgver=v0.1.0
pkgrel=1
pkgdesc="Lightweight text editor written in C."
arch=('x86_64')
url="https://github.com/stefexec/gurkpad"
license=('GPL')
makedepends=('git')
provides=('gpad')
conflicts=('gpad')
_tag=9dde75c357a818826665ec1b06ef12d0ac50fbeb
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
