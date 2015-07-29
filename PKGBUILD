# Contributor: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=goffice-light
_pkgname=goffice
pkgver=0.10.23
pkgrel=1
pkgdesc="A library of document-centric objects and utilities built on top of GLib and Gtk+"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
provides=("goffice=$pkgver")
conflicts=('goffice')
options=('!libtool')
makedepends=('pkgconfig' 'intltool' 'gobject-introspection')
depends=('gtk3' 'libgsf' 'libspectre' 'libxslt')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('1325fc38f2476977bd8d71588ccb2a57aa418260406b7c28a20098b6b4e33f9f')

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
