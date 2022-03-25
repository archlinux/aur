# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname='gr-ieee802-11'
pkgver='0c0fca8'
pkgrel=2
pkgdesc="An IEEE 802.11 a/g/p transceiver for GNU Radio."
arch=('i686' 'x86_64')
url="https://github.com/bastibl/gr-ieee802-11"
license=('GPL3')
depends=('gnuradio' 'swig' 'log4cpp' 'gr-foo')
makedepends=('cmake' 'boost')
provides=('gr-ieee802-11')
source=('git+https://github.com/bastibl/gr-ieee802-11#branch=maint-3.9')
sha1sums=('SKIP')
_gitname=gr-ieee802-11

pkgver() {
  cd "$_gitname"
  echo $(git describe --always | sed 's/-/./g')
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
