# Maintainer: Zezadas <zezadasmoreira@gmail.com>

pkgname=gr-ham-git
pkgver=0ac9253
pkgrel=1
pkgdesc="A collection of GNU Radio blocks useful for amateur radio"
arch=('any')
url="https://github.com/argilo/gr-ham.git"
license=(unknown)
depends=('gnuradio' 'libosmocore')
makedepends=('cmake')
provides=('gr-ham')
source=('git://github.com/argilo/gr-ham.git') 
sha1sums=('SKIP')
_gitname=gr-ham

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
