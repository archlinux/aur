# Maintainer: Fauna <aur@bertie.io>
pkgname=pondidle-git
pkgver=r41.6f76209
pkgrel=2
pkgdesc="Simulates a little pond, complete with lilypads and frogs jumping around."
arch=(x86_64)
url="https://gitlab.com/alice-lefebvre/pond"
license=('GPL-3.0-or-later')
depends=(ncurses)
makedepends=(make gcc)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pond"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/pond"
  make
}

package() {
  cd "pond"
  install -Dm755 bin/pond "$pkgdir/usr/bin/pond"
}
