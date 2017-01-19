# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=girl
pkgver=9.7.1
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Girl"
license=(GPL)
depends=(gst-plugins-base-libs libgnomeui streamripper totem)
makedepends=(gtk-doc intltool itstool)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('35cab81d5342b54d2c352d834c75aaea8b6bfbd6e6fe9a26b239a7d59c6f2af7')

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
