# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname='gr-ieee802-11'
pkgver='b83d008'
pkgrel=2
pkgdesc="An IEEE 802.11 a/g/p transceiver for GNU Radio."
arch=('any')
url="https://github.com/bastibl/gr-ieee802-11"
license=('unknown')
depends=('gnuradio' 'swig' 'log4cpp' 'gr-foo')
makedepends=('cmake' 'boost')
provides=('gr-ieee802-11')
source=('git+https://github.com/bastibl/gr-ieee802-11')
sha1sums=('SKIP')
_gitname=gr-ieee802-11

pkgver() {
  cd "$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$_gitname"
  git checkout master
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
