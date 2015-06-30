# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=frequensea-git
pkgver=3707384
pkgrel=1
pkgdesc="Visualizing the frequency spectrum"
arch=('any')
url="https://github.com/fdb/frequensea/"
license=(MIT)
depends=('rtl-sdr' 'glew' 'glfw' 'lua' 'fftw' 'libpng' 'openal')
provides=('frequensea')
source=('git+https://github.com/fdb/frequensea/') 
sha1sums=('SKIP')
_gitname=frequensea

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  mkdir build
  cd build
  cmake ..
  make 
}

package() {
  install -Dm755 ${srcdir}/${_gitname}/build/frequensea ${pkgdir}/usr/bin/frequensea
}

# vim:set ts=2 sw=2 et:
