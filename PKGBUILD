# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname='gr-ieee802-15-4'
pkgver=v3.6.99.gc969b3f
pkgrel=1
pkgdesc="An 802.15.4 ZigBee transceiver for GNU Radio."
arch=('any')
url="https://github.com/bastibl/gr-ieee802-15-4"
license=('unknown')
depends=('gnuradio' 'swig' 'log4cpp' 'gr-foo')
optdepends=('python2-matplotlib: To run the GUI sample application')
makedepends=('cmake' 'boost')
provides=('gr-ieee802-15-4')
source=('git+https://github.com/bastibl/gr-ieee802-15-4')
sha1sums=('SKIP')
_gitname=gr-ieee802-15-4

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
