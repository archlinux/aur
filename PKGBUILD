# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=freebsd-docs-porters-handbook
pkgver=r51255
pkgrel=1
pkgdesc="The Porter's Handbook from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("${pkgname}.book.html-split.${pkgver}.tar.bz2::ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/porters-handbook/book.html-split.tar.bz2")
sha256sums=('e61895664d60dc1d1059f241fbf10a1b9963c40ee4efc64265c1247996efa4af')

prepare() {
  rm ${pkgname}.book.html-split.${pkgver}.tar.bz2
  msg2 'Correcting paths in html files'
  for j in $(ls $srcdir/*.html); do
    sed -i 's:/local0/docbuild/build/:/usr/share/doc/freebsd/:g' $j        
  done     
}
package() {
  install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/porters-handbook
  cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/porters-handbook/
}
# vim:set ts=2 sw=2 et:
