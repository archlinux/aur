# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gtkdatabox
pkgver=1.0.0
pkgrel=1
pkgdesc="widget for the Gtk+ library designed to display large amounts of numerical data"
arch=(x86_64)
url="http://sourceforge.net/projects/gtkdatabox/"
license=("LGPL")
depends=('gtk3')
makedepends=('gtk-doc' 'dblatex')
options=('docs')
source=(http://downloads.sourceforge.net/project/gtkdatabox/gtkdatabox-1/gtkdatabox-$pkgver.tar.gz)
sha256sums=('8bee70206494a422ecfec9a88d32d914c50bb7a0c0e8fedc4512f5154aa9d3e3')

build() {
  cd "$srcdir"/gtkdatabox-$pkgver
  export LDFLAGS=-lm
  ./configure --prefix=/usr \
    --enable-gtk-doc \
    --enable-gtk-doc-html \
    --enable-gtk-doc-pdf \
    --enable-libglade
  make
}

package() {
  cd "$srcdir"/gtkdatabox-$pkgver
  make DESTDIR="$pkgdir" install
}

