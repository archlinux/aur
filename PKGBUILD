# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Rafael Ferreira <josephgbr@archlinux.info>

pkgname=gtksourceview
pkgver=1.8.5
pkgrel=1
pkgdesc='GNOME library that extends GtkTextView'
url='http://www.gnome.org/'
arch=('x86_64' 'i686')
license=('LGPL' 'GPL')

#depends=('pango' 'libart-lgpl' 'libxml2' 'libgnomecups' 'libgcrypt' 'bzip2')
#makedepends=('intltool' 'pkgconfig' 'addinclude')
#replaces=('libgnomeprint-cups')
#conflicts=('libgnomeprint-cups')
#options=('!libtool')
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgname/1.8/$pkgname-$pkgver.tar.gz")
sha256sums=('36727b1cd5ed311af0c0418c9617f69bc31cc97e2dfef05ba1cc6ce1fb513c9e')

#prepare() {
#  cd "$pkgname-$pkgver"

#  patch -p0 -i "$srcdir/patch-freetype-2.5.1.diff"
#  patch -p0 -i "$srcdir/patch-freetype-2.9.1.diff"
#  addinclude "$pkgname/modules/cups/gnome-print-cups-transport.c" stdio
#  cd "$srcdir"
#  patch -p0 -i libgnomeprint-2.18.8-bison3.patch
#}

build() {
  cd "$pkgname-$pkgver"

  CPPFLAGS=-D_GNU_SOURCE ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  --disable-static --enable-gtk-doc=no --disable-build-tests --disable-gnomeprint
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
