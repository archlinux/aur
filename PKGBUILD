# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=girl
pkgver=9.3.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)  #gtk-update-icon-cache desktop-file-utils
makedepends=(intltool gtk-doc)
url="https://wiki.gnome.org/Apps/Girl"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('6016e4b26ae13a24571d4a882ca4bccdf4b3813aa7af7efd8bda06a52bc216de')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-recording --enable-gtk-doc
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
