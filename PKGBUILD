# Contributor: Allen Li <darkfeline (at) abagofapples.com>

pkgname=projectm-libvisual-alsa
pkgver=2.1.0
pkgrel=4
pkgdesc="A music visualizer using alsa input and libvisual"
url="http://projectm.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
groups=('projectm-pulse')
depends=('projectm' 'projectm-libvisual' 'sdl')
makedepends=('pkgconfig' 'xproto' 'cmake')
source=(http://sourceforge.net/projects/projectm/files/$pkgver/projectM-libvisual-alsa-$pkgver-Source.tar.gz)
md5sums=(7d7e7fdbfc9667961fbbbbe9dd089fb7)

build() {
  cd $srcdir/projectM-libvisual-alsa-$pkgver-Source
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/projectM-libvisual-alsa-$pkgver-Source
  make DESTDIR=$pkgdir install
}

