# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=vala-bootstrap
pkgver=0.16.1
pkgrel=1
pkgdesc='Bootstrapping Compiler for the GObject type system'
url='https://wiki.gnome.org/Projects/Vala'
arch=(i486 i686 pentium4 x86_64)
license=(LGPL)
depends=()
makedepends=(git)
provides=(vala)
conflicts=(vala)
_commit=b2beeacc  # corresponds to 0.16.1
source=("git+https://gitlab.gnome.org/Archive/vala-bootstrap.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-build-from-vala
  make
}

check() {
  cd $pkgname
# tests are horribly broken
#  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
