# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=girl
pkgver=9.4.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)  #gtk-update-icon-cache desktop-file-utils
makedepends=(intltool gtk-doc)
url="https://wiki.gnome.org/Apps/Girl"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('d0a572080be8d5823069ced072c91124d5c06bd02e761850e496c7f04887c703')

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
