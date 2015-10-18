# Maintainer: Robin Nehls <aur@manol.is>

pkgname=gr-bitgate-git
pkgver=aa283bc
pkgrel=1
pkgdesc="Blocks for operations on clocked signal"
arch=('any')
url="https://github.com/viraptor/gr-bitgate"
license=(unknown)
depends=('gnuradio' 'boost' 'swig')
makedepends=('cmake')
provides=('gr-bitgate')
source=('git+https://github.com/viraptor/gr-bitgate.git')
sha1sums=('SKIP')
_gitname=gr-bitgate

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
