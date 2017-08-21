# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=attr-git
pkgver=2.4.47.r49.gc1a7b53
pkgrel=1
pkgdesc="Provides useful functions commonly found on BSD systems"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/attr"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git' 'gettext')
provides=('xfsattr')
conflicts=('xfsattr')
replaces=('xfsattr')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/attr.git")
sha256sums=('SKIP')


pkgver() {
  cd "attr"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "attr"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "attr"

  #make check
}

package() {
  cd "attr"

  make DESTDIR="$pkgdir" install
}
