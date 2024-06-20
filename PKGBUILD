# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: David Brazdil <db538@cam.ac.uk>

pkgname=volnoti
pkgver=0.1
pkgrel=9
pkgdesc='Lightweight volume notification'
url=https://github.com/davidbrazdil/volnoti
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(dbus-glib gdk-pixbuf2 gtk2 librsvg)
makedepends=(git glib2-devel)
source=("$pkgname::git+$url.git#commit=958415b")
sha256sums=('c77a014906277de50d9839ca8127cce96c73c7adabbdc05de4fbcc688690440f')

build() {
  cd $pkgname

  #./prepare.sh
  autoreconf --force --install
  autoupdate --force

  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname DESTDIR="$pkgdir" install
}
