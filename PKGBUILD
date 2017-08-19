# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmicrohttpd-git
pkgver=0.9.55.r75.gc0168fde
pkgrel=1
pkgdesc="A small C library that make it easy to run an HTTP server as part of another application"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libmicrohttpd/"
license=('LGPL')
depends=('glibc' 'gnutls')
makedepends=('git')
checkdepends=('curl')
provides=('libmicrohttpd')
conflicts=('libmicrohttpd')
options=('staticlibs')
source=("git+https://gnunet.org/git/libmicrohttpd.git")
sha256sums=('SKIP')


pkgver() {
  cd "libmicrohttpd"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libmicrohttpd"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libmicrohttpd"

  #make check
}

package() {
  cd "libmicrohttpd"

  make DESTDIR="$pkgdir" install
}
