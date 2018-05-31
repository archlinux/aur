_pkgname=gxml
_major=0
_minor=16
_patch=3
pkgname=$_pkgname
pkgver=$_major.$_minor.$_patch
pkgrel=1
pkgdesc="GObject XML and Serialization API"
arch=('x86_64')
license=('LGPL')
depends=('glib2' 'libgee' 'libxml2')
makedepends=('gobject-introspection' 'vala' 'intltool')
url="https://wiki.gnome.org/GXml"
source=("http://ftp.gnome.org/pub/gnome/sources/gxml/$_major.$_minor/gxml-$_major.$_minor.$_patch.tar.xz")
sha256sums=('520d4d779b1d31591762b2a98f84072531b9e17ac401df9668493e189eafc6ba')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
