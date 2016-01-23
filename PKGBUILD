# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=controlscontrol
pkgver=0.1.0
pkgrel=2
pkgdesc="A simple space shooter with a plot twist - control buttons keep being changed."
arch=('i686' 'x86_64')
url='http://dos.itch.io/controls-control'
license=('GPL2+')
depends=('allegro')
makedepends=('cmake')
source=(http://dosowisko.net/games/ControlsControl-$pkgver-Linux.tar.gz)
sha256sums=('93b7fbc61bbf4e4ef37047eeab4f020e7d3967cb5105477170f5ef0298515225')

build() {
  mkdir "$pkgname/build"
  cd "$pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"  -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname/build"
  make install
}
