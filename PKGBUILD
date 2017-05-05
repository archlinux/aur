# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=freeorion
pkgver=0.4.7
pkgrel=1
pkgdesc="turn-based space empire and galactic conquest (4X) computer game"
url="http://www.freeorion.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('boost-libs' 'python2' 'sdl2' 'libvorbis' 'glew' 'openal' 'hicolor-icon-theme' 'freetype2')
makedepends=('boost' 'cmake')
conflicts=('freeorion-git')
source=("https://github.com/freeorion/freeorion/releases/download/v0.4.7/FreeOrion_v0.4.7_2017-04-24.60d06dc_Source.tar.gz")

prepare() {
  cd $srcdir/src-tarball

  mkdir -p build
}

build() {
  cd $srcdir/src-tarball/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  cd $srcdir/src-tarball/build

  make DESTDIR=$pkgdir install
}

md5sums=('30db1505f398403df04707b6e69f79f2')
