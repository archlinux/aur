# Maintainer: Daniel Araujo <contact@daniel-araujo.pt>
pkgname='click4ever'
pkgver='1.2.0'
pkgrel='2'
pkgdesc='An auto clicker for Linux running X11. A program that generates a lot of mouse clicks per second at the current position of the mouse until you move it away.'
url='https://github.com/daniel-araujo/click4ever'
arch=('x86_64')
license=('GPL3')
depends=('xdotool')
makedepends=('git' 'cmake' 'boost')
source=("git+https://github.com/daniel-araujo/click4ever.git#tag=v1.2.0")
md5sums=('SKIP')

build() {
  mkdir -p click4ever/build
  cd click4ever/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
}

package() {
  cd click4ever/build
  make DESTDIR="$pkgdir/" install
}
