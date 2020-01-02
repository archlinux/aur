# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=firetools-git
pkgver=0.9.62.r1.g15a4571
pkgrel=1
pkgdesc="Graphical user interface of Firejail"
arch=('i686' 'x86_64')
url="https://firejail.wordpress.com/"
license=('GPL')
depends=('firejail' 'qt5-base')
makedepends=('git')
provides=('firetools')
conflicts=('firetools')
source=("git+https://github.com/netblue30/firetools.git")
sha256sums=('SKIP')


pkgver() {
  cd "firetools"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "firetools"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "firetools"

  make DESTDIR="$pkgdir" install
}
