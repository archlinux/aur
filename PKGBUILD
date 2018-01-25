# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=libgtkhtml
pkgver=2.11.1
pkgrel=7
pkgdesc="An HTML library for GTK"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
depends=('gtk2>=2.22.1' 'libxml2>=2.7.8' 'gnome-vfs')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/2.11/$pkgname-$pkgver.tar.gz")
sha256sums=('905efcb61ca0cf3b876af55d4ee2a7685472594c2bd5d318b00fb289d5de6c3b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
