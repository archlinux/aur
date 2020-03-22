# Maintainer: Alexander Bus <busfromrus@gmail.com>

pkgname=szsol-git
pkgver=r44.f73e8b7
pkgrel=1
pkgdesc="ncurses clone of Shenzhen Solitaire card game"
arch=('any')
url="https://github.com/usrshare/szsol"
license=('MIT')
makedepends=('git' 'ncurses')
source=('git+https://github.com/usrshare/szsol')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/szsol"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/szsol"
  make
}

package() {
  install -Dm755 "$srcdir/szsol/szsol" "$pkgdir/usr/bin/szsol"
  install -Dm755 "$srcdir/szsol/exasol" "$pkgdir/usr/bin/exasol"
  install -Dm644 $srcdir/szsol/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
