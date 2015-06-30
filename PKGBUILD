# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=gr-gsm-git
pkgver=92398cf
pkgrel=1
pkgdesc="Gnuradio blocks and tools for receiving GSM transmissions"
arch=('any')
url="https://github.com/ptrkrysik/gr-gsm"
license=(unknown)
depends=('gnuradio' 'boost' 'swig' 'log4cpp' 'python2-scipy')
makedepends=('cmake')
provides=('gr-gsm')
source=('git+https://github.com/ptrkrysik/gr-gsm') 
sha1sums=('SKIP')
_gitname=gr-gsm

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
