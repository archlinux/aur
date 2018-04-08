# Maintainer: Andrew Vos <andrew at andrewvos dot com>
pkgname=vbar-git
pkgver=08042018
pkgrel=1
pkgdesc="A bar"
arch=('any')
url="https://github.com/AndrewVos/vbar"
license=()
depends=('gtk3')
makedepends=('git' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_go_url=github.com/AndrewVos/vbar
# md5sums=('SKIP' 'SKIP')

check() {
  echo "done"
}

build() {
  cd "$srcdir"
  GOPATH="$srcdir"
  go get ${_go_url}
}

package() {
  cd "$srcdir"

  install -Dm755 bin/vbar "$pkgdir/usr/bin/vbar"

  mkdir -p "$pkgdir/usr/share/doc/vbar/examples"
  install -Dm644 "$srcdir/src/github.com/AndrewVos/vbar/examples/vbarrc" "$pkgdir/usr/share/doc/vbar/examples/vbarrc"
}
