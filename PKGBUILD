# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.10
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-setuptools' 'intltool' 'itstool' 'pep8-python3' 'gobject-introspection')
install=d-feet.install
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('88f0df5fcb862387ff3d1793873c5eb368c3e4db0bbd82ea65f748cbf70a6359')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
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
