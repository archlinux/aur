# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=girl
pkgver=8.4.2
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper desktop-file-utils)
makedepends=(intltool)
url="https://wiki.gnome.org/Apps/Girl"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('408be03ee949ce3582db6d14001e9c3d9157ee8600d3bf6b10895630bfeef866')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-recording --enable-gtk-doc
  make
}

package(){
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
