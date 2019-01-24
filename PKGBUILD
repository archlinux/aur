# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gtkdatabox
pkgver=0.9.3.1
pkgrel=1
pkgdesc="widget for the Gtk+ library designed to display large amounts of numerical data"
arch=(x86_64)
url="http://sourceforge.net/projects/gtkdatabox/"
license=("LGPL")
depends=('gtk2' 'libglade')
makedepends=('gtk-doc')
options=('docs')
source=(http://downloads.sourceforge.net/project/gtkdatabox/gtkdatabox/$pkgver/gtkdatabox-$pkgver.tar.gz)
md5sums=('46c64813080a06a9a3111e283c62e4f2')

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
