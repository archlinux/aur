# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: David Brazdil <db538@cam.ac.uk>

pkgname=volnoti
pkgver=0.1
pkgrel=6
pkgdesc="Lightweight volume notification"
url="https://www.github.com/davidbrazdil/volnoti"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dbus-glib' 'gdk-pixbuf2' 'gtk2' 'librsvg')
makedeps=('git')
source=(http://github.com/downloads/davidbrazdil/volnoti/$pkgname-$pkgver.tar.gz)
md5sums=('f1e7a3730528b8808228415990d398f9')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

