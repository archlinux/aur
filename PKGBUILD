# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=ding-libs-git
pkgver=0.5.0
pkgrel=1
pkgdesc="'D is not GLib' utility libraries"
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/git/ding-libs.git"
license=('GPL3')
makedepends=('doxygen' 'git')
provides=('ding-libs')
conflicts=('ding-libs')
source=("git://git.fedorahosted.org/ding-libs.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/ding-libs"
  git describe | sed 's/^ding_libs-//; s/_/./g'
}

build() {
  cd "$srcdir/ding-libs"
  autoreconf -i -f
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ding-libs"
  make DESTDIR="$pkgdir" install
} 

# vim: ts=2:sw=2:et
