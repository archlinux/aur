# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=m2status
pkgver=16.0ad8780
pkgrel=1
pkgdesc="i3 status line generator written in Go"
url="https://github.com/mutantmonkey/m2status"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'go')
source=("git+https://github.com/mutantmonkey/m2status.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"
  GOPATH="$srcdir" go get -v -d
  GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 m2status "${pkgdir}/usr/bin/m2status"
}

# vim:set ts=2 sw=2 et:
