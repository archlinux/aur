# Maintainer:  <zhaose233@outlook.com>
pkgname=zj-58-git
pkgver=r27.6474356
pkgrel=1
pkgdesc=" CUPS filter for thermal printers as Zjiang ZJ-58, XPrinter XP-58, etc"
arch=('x86_64' 'aarch64')
url="https://github.com/klirichek/zj-58"
license=('BSD')
depends=('cups')
makedepends=('cmake')
provides=('zj-58')

source=("git+https://github.com/klirichek/zj-58.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/zj-58"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/zj-58"
  mkdir build
  cd build
  cmake ..
  cmake --build .
}

package() {
  cd "$srcdir/zj-58/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
