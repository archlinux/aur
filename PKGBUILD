# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=girl
pkgver=9.9.6
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Girl"
license=(GPL)
depends=(gst-plugins-base-libs libgnomeui streamripper totem)
makedepends=(gtk-doc intltool itstool)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('80ea013b21405e7cc4e4c10e94a7f41d3e2ff1791d303985d61bb89a47aa023b')

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
