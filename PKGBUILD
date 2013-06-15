# $Id: PKGBUILD 89694 2010-09-03 10:37:56Z remy $
# Old contributor: simo <simo@archlinux.org>
# Old Contributor: twa022 <twa022 at gmail dot com>
# Maintainer: Swift Geek

pkgname=python2-gtkglext
pkgver=1.1.0
pkgrel=6
pkgdesc="Python language bindings for GtkGLExt"
arch=(i686 x86_64)
depends=('gtkglext' 'mesa' 'python2-opengl' 'pygtk')
makedepends=('libxmu')
url="http://gtkglext.sourceforge.net/"
source=(http://downloads.sourceforge.net/gtkglext/pygtkglext-$pkgver.tar.bz2)
license="LGPL"
md5sums=('720b421d3b8514a40189b285dd91de57')
 
build() {
  cd $srcdir/pygtkglext-$pkgver
  PYTHON='/usr/bin/python2' ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/pygtkglext-$pkgver
  make DESTDIR=$pkgdir install
  find $pkgdir -name '*.la' -exec rm {} \; 
}
