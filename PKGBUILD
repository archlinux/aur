# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-recipes
pkgver=1.0.0
pkgrel=1
pkgdesc="Recipe management application for GNOME"
arch=(x86_64 i686)
url="https://wiki.gnome.org/Apps/Recipes"
license=(GPL3)
depends=(gnome-autoar gspell libcanberra)
checkdepends=(appstream-glib)
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('d291a597c9d5882b03ba21297d6b4b04cd1748cabebe8f4c97b97f9ece3df5c8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
