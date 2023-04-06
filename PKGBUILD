# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=automake-git
pkgver=1.16.5.r102.gc04c4e885
pkgrel=1
pkgdesc="A tool for automatically generating Makefiles"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/automake/"
license=('GPL2')
depends=('sh' 'perl')
makedepends=('git')
provides=("automake=$pkgver")
conflicts=('automake')
source=("git+https://git.savannah.gnu.org/git/automake.git")
sha256sums=('SKIP')


pkgver() {
  cd "automake"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "automake"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "automake"

  #make check
}

package() {
  cd "automake"

  make DESTDIR="$pkgdir" install
}
