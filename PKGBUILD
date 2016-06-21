# $Id$
# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_pkgname=gxml
pkgname=$_pkgname
pkgver=0.10.0
pkgrel=1
pkgdesc="GObject XML and Serialization API"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'vala')
url="https://wiki.gnome.org/GXml"
source=('http://ftp.gnome.org/pub/gnome/sources/gxml/0.10/gxml-0.10.0.tar.xz')
sha256sums=('7d8b9c503fdfaa056031133c5527418f4eb2591570704babb19b5419ef47a944')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
