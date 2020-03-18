# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=arcade-learning-environment
pkgver=0.6.1
pkgrel=1
pkgdesc='The Arcade Learning Environment (ALE) is a simple object-oriented framework that allows researchers and hobbyists to develop AI agents for Atari 2600 games'
arch=('x86_64')
url="https://github.com/mgbellemare/Arcade-Learning-Environment"
license=('GPL2')
makedepends=('cmake' 'sdl')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('7834587b59ce0a6c744702e1129c8d37')

build() {
  cd "${srcdir}/Arcade-Learning-Environment-${pkgver}"
  mkdir build && cd build
  cmake -DUSE_SDL=ON -DUSE_RLGLUE=OFF -DBUILD_EXAMPLES=ON  -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j `nproc`
}

package() {
  cd "${srcdir}/Arcade-Learning-Environment-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: