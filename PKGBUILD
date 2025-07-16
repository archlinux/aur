# Maintainer: Minecodes <minecodes at minecodes.de>
pkgname=rbcat
pkgver=v1.0.1
pkgrel=3
groups=('mcds')
pkgdesc="A go clone of lolcat with built-in cat function."
arch=('x86_64')
url="https://codeberg.org/Minecodes/rbcat"
license=('bsd-4-clause')
makedepends=('go')
source=("https://git.minecodes.de/thies/rbcat/raw/branch/main/main.go")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  export GOPATH="$srcdir"
  go build -o rbcat main.go
}

package() {
  cd "$srcdir"
  install -Dm755 rbcat "$pkgdir/usr/bin/rbcat"
}

