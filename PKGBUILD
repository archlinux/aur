# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=kazan-git
pkgver=20170908
pkgrel=1
pkgdesc="Software-rendering Vulkan implementation"
arch=('i686' 'x86_64')
url="http://kazan-3d.org"
license=('unknown')
makedepends=('git' 'cmake' 'clang')
provides=('kazan')
conflicts=('kazan')
source=('git+git://github.com/kazan-3d/kazan.git')
md5sums=('SKIP')

build() {
  cd "${srcdir}/kazan"

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  export CC=clang
  export CXX=clang++
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "${srcdir}/kazan/build"

  make install DESTDIR=install
}

# vim:set ts=2 sw=2 et:
