# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtasn1-git
pkgver=4.12.r1.gd8d805e
pkgrel=1
pkgdesc="The ASN.1 library used by GnuTLS, GNU Shishi "
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libtasn1/"
license=('GPL3' 'LGPL')
depends=('glibc')
makedepends=('git' 'gtk-doc')
provides=('libtasn1')
conflicts=('libtasn1')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/libtasn1.git")
sha256sums=('SKIP')


pkgver() {
  cd "libtasn1"

  git describe --long --tags | sed 's/^libtasn1_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "libtasn1"

  make bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libtasn1"

  make check
}

package() {
  cd "libtasn1"

  make DESTDIR="$pkgdir" install
}
