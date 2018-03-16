# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=gr-gsm-git
pkgver=r903.c097ce7
pkgrel=1
pkgdesc="Gnuradio blocks and tools for receiving GSM transmissions"
arch=('any')
url="https://github.com/ptrkrysik/gr-gsm"
license=(unknown)
depends=('gnuradio' 'libosmocore' 'boost' 'swig' 'log4cpp' 'python2-scipy' 'qwt5' 'gnuradio-companion' 'python2-pyqt4')
makedepends=('cmake')
provides=('gr-gsm')
source=('git+https://github.com/ptrkrysik/gr-gsm') 
sha1sums=('SKIP')
_gitname=gr-gsm

pkgver() {
  cd $_gitname
  printf "v%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
