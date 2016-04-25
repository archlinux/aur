# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.11
pkgrel=1
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-setuptools' 'intltool' 'itstool' 'pep8-python3' 'gobject-introspection')
install=d-feet.install
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a3dc940c66f84b996c328531e3034d475ec690d7ff639445ff7ca746aa8cb9c2')

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
