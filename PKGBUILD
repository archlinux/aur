# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=girl
pkgver=9.9.5
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Girl"
license=(GPL)
depends=(gst-plugins-base-libs libgnomeui streamripper totem)
makedepends=(gtk-doc intltool itstool)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('13c1925184343f76e13756d8130ac6030a6e3de18c8491705821fd50c7517466')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

check(){
  cd $pkgname-$pkgver
  make check
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
