# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=m4-git
pkgver=r359.gd69fa528
pkgrel=2
pkgdesc="The GNU macro processor"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/m4/m4.html"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gettext' 'gperf' 'help2man' 'rsync' 'texinfo')
provides=('m4')
conflicts=('m4')
source=("git+https://git.savannah.gnu.org/git/m4.git#branch=branch-2.0")
sha256sums=('SKIP')


pkgver() {
  cd "m4"

  git describe --long --tags | sed 's/^cvs-readonly-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "m4"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "m4"

  #make check
}

package() {
  cd "m4"

  make DESTDIR="$pkgdir" install
}
