# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.14.1
_pkgver=1.14
pkgrel=1
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('python' 'libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libunique3' 'gtk2')
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools')
source=(https://download.gnome.org/sources/gnome-commander/${_pkgver}/$pkgname-$pkgver.tar.xz)
sha256sums=('73125b40969c76ee465b77ee1b305251a119658db8361e67283ae38a5942aff5')

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
