# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=girl
pkgver=9.2.0
pkgrel=1
pkgdesc="GNOME Internet Radio Locator"
arch=(i686 x86_64)
license=(GPL)
depends=(libgnomeui totem streamripper)  #gtk-update-icon-cache desktop-file-utils
makedepends=(intltool gtk-doc)
url="https://wiki.gnome.org/Apps/Girl"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('039af9b3f9f41c1fbf0c6f58429f68940823603479730663b120ddd9d0406837')

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
