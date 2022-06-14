# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>

pkgname='gr-ieee802-11-git'
pkgver=r352.0c0fca8
pkgrel=1
pkgdesc="An IEEE 802.11 a/g/p transceiver for GNU Radio."
arch=('i686' 'x86_64')
url="https://github.com/bastibl/gr-ieee802-11"
license=('GPL3')
depends=('gnuradio' 'log4cpp' 'gr-foo')
makedepends=('cmake' 'boost')
provides=('gr-ieee802-11')
source=('git+https://github.com/bastibl/gr-ieee802-11#branch=maint-3.10')
sha1sums=('SKIP')
_gitname=gr-ieee802-11

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$_gitname"
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
