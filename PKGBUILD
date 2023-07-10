# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=qwlroots-git
pkgver=r166.093e076
pkgrel=1
pkgdesc='Qt and QML bindings for wlroots.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/qwlroots"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'wlroots-git')
provides=('qwlroots')
source=("$pkgname::git+https://github.com/vioken/qwlroots")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $pkgname
  cmake -B . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
}
