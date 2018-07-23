# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.13
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('intltool' 'itstool' 'gobject-introspection')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('941a2fda5a06deaeeb1eddd1e02c1eef6ddcaf8d6fb5647423e0e952f4a7a3d5')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-tests
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
