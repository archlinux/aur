# Maintainer: Daneel <aur@gnoulibre.org>

pkgname='libemon'
pkgver='1.3.1'
pkgrel=1
pkgdesc="Library for Efficient Modeling and Optimization in Networks"
arch=('i686' 'x86_64')
url="http://lemon.cs.elte.hu/trac/lemon"
license=('boost')
depends=()
makedepends=('cmake')
backup=()
options=(!emptydirs)
source=("http://lemon.cs.elte.hu/pub/sources/lemon-$pkgver.tar.gz")
sha256sums=('71b7c725f4c0b4a8ccb92eb87b208701586cf7a96156ebd821ca3ed855bad3c8')

package() {
  cd "${srcdir}/lemon-${pkgver}"
  [ -d build ] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
  make 
  sed -i'' "s@${pkgdir}@@" "lemon/lemon.pc"
  sed -i'' "s@${pkgdir}@@" "cmake/LEMONConfig.cmake"
  make install
}

# vim:set ts=2 sw=2 et:
