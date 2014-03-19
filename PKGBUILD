# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.8
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL')
depends=('gtk3' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-setuptools' 'intltool' 'itstool' 'pep8-python3')
install=d-feet.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e8423feb18fdff9b1465bf8442b78994ba13c12f8fa3b08e6a2f05768b4feee5')

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
