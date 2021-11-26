# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.12.3.1
_pkgver=1.12
pkgrel=2
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('python' 'libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libunique3' 'gnome-vfs' 'gtk2')
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools')
source=(https://download.gnome.org/sources/gnome-commander/${_pkgver}/$pkgname-$pkgver.tar.xz)
sha256sums=('42eb16b96ec5d2ee67e38870e01361bb60471e69c7c675f77b90ad696077153a')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
	      --localstatedir=/var --with-help-dir=/usr/share/doc/$pkgname
  make
}

package() {
  cd "$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
 }
