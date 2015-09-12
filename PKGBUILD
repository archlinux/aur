# Maintainer: Robin Nehls <aur@manol.is>

pkgname=gr-dect2-git
pkgver=a2a8f9d
pkgrel=1
pkgdesc="This project was developed to demonstrate the possibility of real-time DECT voice channel decoding by Gnuradio."
arch=('any')
url="https://github.com/pavelyazev/gr-dect2"
license=(unknown)
depends=('gnuradio' 'boost' 'swig')
makedepends=('cmake')
provides=('gr-dect2')
source=('git+https://github.com/pavelyazev/gr-dect2.git')
sha1sums=('SKIP')
_gitname=gr-dect2

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
