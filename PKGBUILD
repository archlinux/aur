_pkgname=gxml
_major=0
_minor=14
_patch=3
pkgname=$_pkgname
pkgver=$_major.$_minor.$_patch
pkgrel=1
pkgdesc="GObject XML and Serialization API"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'vala' 'intltool')
url="https://wiki.gnome.org/GXml"
source=("http://ftp.gnome.org/pub/gnome/sources/gxml/$_major.$_minor/gxml-$_major.$_minor.$_patch.tar.xz")
sha256sums=('b4f9739f924fefc90dd5d54da7680a50377bfba1342bd16436ab387c631e3b41')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
