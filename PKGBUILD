# Maintainer: Daniel Araujo <contact@daniel-araujo.pt>
pkgname='click4ever'
pkgver='1.0.2'
pkgrel='3'
pkgdesc='An auto clicker for Linux running X11. A program that generates a lot of mouse clicks per second at the current position of the mouse until you move it away.'
url='https://github.com/daniel-araujo/click4ever'
arch=('x86_64')
license=('GPL3')
depends=('xdotool')
makedepends=('git' 'autoconf' 'automake')
source=("git+https://github.com/daniel-araujo/click4ever.git#tag=v1.0.2")
md5sums=('SKIP')

build() {
  cd click4ever
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd click4ever
  make DESTDIR="$pkgdir/" install
}
