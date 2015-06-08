# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=goffice-light
_pkgname=goffice
pkgver=0.10.21
pkgrel=1
pkgdesc="A library of document-centric objects and utilities built on top of GLib and Gtk+"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
provides=('goffice')
conflicts=('goffice')
options=('!libtool')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
depends=('librsvg' 'gtk3' 'libgsf' 'libspectre' 'libxslt')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('be3cd0f31bb304369283fd13b441aa67705e62231db2001da191c49f724749c2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-gtk-doc-html           \
      --localstatedir=/var --enable-introspection 
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
