# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=cork-git
_gitname=cork
pkgver=r24.5987de5
pkgrel=1
pkgdesc="3D Boolean / CSG Library"
arch=('i686' 'x86_64')
url="https://github.com/gilbo/cork/"
license=('LGPL3')
depends=('gmp')
makedepends=('clang')
source=("git://github.com/gilbo/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"
  install -D -m 755 bin/cork "$pkgdir/usr/bin/cork"
  install -D -m 755 bin/off2obj "$pkgdir/usr/bin/off2obj"
  install -D -m 644 lib/libcork.a "$pkgdir/usr/lib/libcork.a"
  install -D -m 644 include/cork.h "$pkgdir/usr/include/cork.h"
}

# vim:set ts=2 sw=2 et:
