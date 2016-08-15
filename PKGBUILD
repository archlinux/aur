# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=girl
pkgver=9.5.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)  #gtk-update-icon-cache desktop-file-utils
makedepends=(intltool gtk-doc)
url="https://wiki.gnome.org/Apps/Girl"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('97249da8df923c4fc78523cb482c4a062c8cd82d4e63e0723ddb1adfb6e3bd71')

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
