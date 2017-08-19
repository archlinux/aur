# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdvbcsa-git
pkgver=bc6c0b1
pkgrel=2
epoch=1
pkgdesc="An implementation of the DVB Common Scrambling Algorithm"
arch=('i686' 'x86_64')
url="https://www.videolan.org/developers/libdvbcsa.html"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('libdvbcsa')
conflicts=('libdvbcsa')
options=('staticlibs')
source=("git+https://code.videolan.org/videolan/libdvbcsa.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdvbcsa"

  git describe --always
}

build() {
  cd "libdvbcsa"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libdvbcsa"

  make check
}

package() {
  cd "libdvbcsa"

  make DESTDIR="$pkgdir" install
}
