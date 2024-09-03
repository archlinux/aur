# Maintainer: Vincent Bernardoff <vb AT luminar DOT eu DOT org>

pkgname=gk-git
pkgver=r94.a48c5fa
pkgrel=1
pkgdesc="an implementation of the k programming language"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/cmh25/gk"
license=('AGPL3')
depends=()
source=('git+https://github.com/cmh25/gk.git')
sha256sums=('SKIP')

pkgver() {
  cd gk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gk
  make
}

check() {
  cd gk
  make test
}

package() {
  cd gk
  install -Dm755 gk "$pkgdir/usr/bin/gk"
  install -Dm644 -t "$pkgdir/usr/include/gk" k.h
}
