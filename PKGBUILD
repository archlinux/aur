# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-recipes
pkgver=1.0.4
pkgrel=1
pkgdesc="Recipe management application for GNOME"
arch=(x86_64 i686)
url="https://wiki.gnome.org/Apps/Recipes"
license=(GPL3)
depends=(gnome-autoar gspell libcanberra)
makedepends=(itstool)
checkdepends=(appstream-glib)
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('f8f1f0f79121e91130a589b1c20ad4739d93d2253232ecdc3d4bc966db7efc45')

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
