# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.11
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('intltool' 'itstool' 'gobject-introspection')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a3dc940c66f84b996c328531e3034d475ec690d7ff639445ff7ca746aa8cb9c2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-tests
  make
}

check() {
  cd $pkgname-$pkgver
  # Needs X
  #make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
