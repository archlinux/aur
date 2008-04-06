# $Id: PKGBUILD,v 1.8 2006/04/02 09:57:31 jgc Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=libcroco
pkgver=0.6.1
pkgrel=1
pkgdesc="GNOME CSS2 parsing and manipulation toolkit"
depends=('glib2>=2.10.1' 'libxml2')
makedepends=(intltool pkgconfig)
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.6/$pkgname-$pkgver.tar.bz2)
url="http://www.gnome.org"
md5sums=(b0975bd01eb11964f1b3f254f267a43d)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -rf $startdir/pkg/usr/share/gtk-doc
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
