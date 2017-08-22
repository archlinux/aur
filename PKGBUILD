# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dejagnu-git
pkgver=1.4.3.r513.ge301ae8
pkgrel=1
pkgdesc="A framework for testing other programs"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/dejagnu/"
license=('GPL3')
depends=('expect' 'sh')
makedepends=('git')
provides=('dejagnu')
conflicts=('dejagnu')
source=("git+https://git.savannah.gnu.org/git/dejagnu.git")
sha256sums=('SKIP')


pkgver() {
  cd "dejagnu"

  git describe --long --tags | sed 's/^dejagnu_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "dejagnu"

  ./configure --prefix="/usr"
  make
}

check() {
  cd "dejagnu"

  make check
}

package() {
  cd "dejagnu"

  make DESTDIR="$pkgdir" install
}
