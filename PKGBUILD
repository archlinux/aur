# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: David Brazdil <db538@cam.ac.uk>

pkgname=volnoti
pkgver=0.1
pkgrel=8
pkgdesc='Lightweight volume notification'
url=https://github.com/davidbrazdil/volnoti
arch=(x86_64)
license=(GPL3)
depends=(dbus-glib gdk-pixbuf2 gtk2 librsvg)
makedepends=(git python3)
source=("$pkgname::git+$url.git#commit=958415b")
sha256sums=('SKIP')

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
