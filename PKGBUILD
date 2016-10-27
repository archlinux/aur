_pkgname=gxml
pkgname=$_pkgname
pkgver=0.12.0
pkgrel=1
pkgdesc="GObject XML and Serialization API"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'vala')
url="https://wiki.gnome.org/GXml"
source=('http://ftp.gnome.org/pub/gnome/sources/gxml/0.12/gxml-0.12.0.tar.xz')
sha256sums=('f9310d81078df031c8a5defc90be814a4666e641fb242cd3f4b6f3b6706fb44d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
