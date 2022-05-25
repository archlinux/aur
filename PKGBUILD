# Maintainer: WillyJL <willy.leslie@icloud.com>
pkgname="qursers-git"
pkgver=r37.d62ec6b
pkgrel=1
pkgdesc="a sleek linux cursor pack made by qube-03"
arch=("any")
url="https://github.com/qube-03/qursers"
provides=("qursers")
conflicts=("qursers")
depends=()
makedepends=("git")
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
  cd qursers
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd qursers
  make DESTDIR="$pkgdir" install
}
