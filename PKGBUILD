# Maintainer: Tanner Filip <tannerremovemefilip at gmail dot com> 
# For contact, remove "removeme" and replace words with symbols as necessary.
pkgname=huggle-git
pkgver=r.
pkgver() {
  cd "$srcdir/huggle3-qt-lx"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Huggle Anti-Vandalism tool for Wikipedia"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
makedepends=('git' 'qconf')
groups=('base-devel')
source=('git+https://github.com/huggle/huggle3-qt-lx.git')
md5sums=('SKIP') 

build() {
  cd "$srcdir/huggle3-qt-lx/huggle"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/huggle3-qt-lx/huggle"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
