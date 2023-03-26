# Maintainer: Daniel Araujo <contact@daniel-araujo.pt>
pkgname='click4ever'
pkgver='1.3.0'
pkgrel='2'
pkgdesc='An auto clicker for Linux running X11. Generates mouse clicks at a specified location. Can pause when moving away and resume when going back.'
url='https://github.com/daniel-araujo/click4ever'
arch=('x86_64')
license=('GPL3')
depends=('xdotool' 'boost')
makedepends=('git' 'cmake')
source=("git+https://github.com/daniel-araujo/click4ever.git#tag=v1.3.0")
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
