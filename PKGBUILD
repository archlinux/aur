# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.5
pkgrel=1
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://live.gnome.org/DFeet"
license=('GPL')
depends=('gtk3' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-distribute' 'intltool' 'itstool' 'pep8-python3')
install=d-feet.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('7100c62d2ba6205fb2a040e0b2efe8cc7f7ca54e5a14e1e410d070a72544ab8a')

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
