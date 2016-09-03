# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=girl
pkgver=9.5.1
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)  #gtk-update-icon-cache desktop-file-utils
makedepends=(intltool gtk-doc)
url="https://wiki.gnome.org/Apps/Girl"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('a18b1803600a7f94ff8577276dd7094b858af970262d67486eb8828d4d39bd87')

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
