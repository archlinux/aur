# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=automake-git
pkgver=1.15.r180.gcc7231cc3
pkgrel=1
pkgdesc="A tool for automatically generating Makefiles"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/automake/"
license=('GPL2')
depends=('sh' 'perl')
makedepends=('git')
provides=('automake')
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
  ./configure --prefix="/usr"
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
