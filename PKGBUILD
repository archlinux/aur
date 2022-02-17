# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=ngnk-git
pkgver=r3093.c017192
pkgrel=1
pkgdesc="simple fast vector programming language"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://codeberg.org/ngn/k"
license=('AGPL3')
depends=()
source=("git+https://codeberg.org/ngn/k.git")
sha256sums=('SKIP')

pkgver() {
  cd k
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd k
  make k-dflt
}

check() {
  cd k
  make t
}

package() {
  cd k
  install -Dm755 k "$pkgdir"/usr/bin/ngnk
  install -Dm644 repl.k "$pkgdir"/usr/lib/ngnk/repl.k
  install -Dm644 g.k "$pkgdir"/usr/lib/ngnk/g.k
}
