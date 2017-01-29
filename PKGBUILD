# Contributor: Dr.Schliemann <doktor.schliemann at gmail dot com>
# Contributor: JHeaton <jheaton at archlinux dot us>

pkgname=basenji
pkgver=1.0.1
pkgrel=1
pkgdesc="Volume indexing tool designed for easy and fast indexing of CD/DVD and other type of volume collections."
arch=('any')
url="https://launchpad.net/basenji"
license=('GPL')
depends=('dbus-sharp-glib' 'gnome-desktop2' 'gtk-sharp-2' 'taglib-sharp' 'udisks')
makedepends=('gio-sharp')
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('eee951ac995359bedab23b964a8e5502')

prepare() {
  sed -i 's/dbus-sharp-1.0/dbus-sharp-2.0/
          s/dbus-sharp-glib-1.0/dbus-sharp-glib-2.0/' configure Platform/Makefile
}

build() {
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir" install
}
