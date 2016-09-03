# Maintainer: Davide Gerhard < rainbow at irh dot it> PGP-Key:

pkgname=gr-iridium-git
pkgver=db88eb4
pkgrel=1
pkgdesc="Gnuradio blocks and tools for receiving Iridium transmissions"
arch=('any')
url="https://github.com/muccc/gr-iridium"
license=('GPL3')
depends=('gnuradio' 'python2-scipy' 'python2-numpy' 'gnuradio-osmosdr')
makedepends=('cmake')
provides=('gr-iridium')
source=('git+https://github.com/muccc/gr-iridium')
sha1sums=('SKIP')
_gitname=gr-iridium

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
