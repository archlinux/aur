# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=controlscontrol
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple space shooter with a plot twist - control buttons keep being changed."
arch=('i686' 'x86_64')
url='http://dos.itch.io/controls-control'
license=('GPL2+')
depends=('allegro')
makedepends=('cmake')
source=(http://dosowisko.net/games/ControlsControl-$pkgver-Linux.tar.gz)
sha256sums=('153076ebe59dccd7265e463e84be358e620944d6349f1154cbb582a6bf4bc2b5')

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
