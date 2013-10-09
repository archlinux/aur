# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.7
pkgrel=1
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/DFeet"
license=('GPL')
depends=('gtk3' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-distribute' 'intltool' 'itstool' 'pep8-python3')
install=d-feet.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('159792a699f4cee6ee18eb03c15fd44bffc6249fb5227c67b6e2bc3f48081912')

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
