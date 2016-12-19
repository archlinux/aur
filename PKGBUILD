# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=girl
pkgver=9.6.1
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Girl"
license=(GPL)
depends=(gstreamer0.10-base libgnomeui streamripper totem)
makedepends=(gtk-doc intltool itstool)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('85f1ab6e7e246bb525ac0b760130a71fb201c78a8985a663f5c965cb1e280023')

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
