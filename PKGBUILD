# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=freebsd-docs-developers-handbook
pkgver=r51152
pkgrel=1
pkgdesc="The FreeBSD Developers' Handbook from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("${pkgname}.book.html-split.${pkgver}.tar.bz2::ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/developers-handbook/book.html-split.tar.bz2")
sha256sums=('2828a4f14777785158e6bbffa3cf632cdaac91d6a86bbb8394935997ffb550c5')

prepare() {
  rm ${pkgname}.book.html-split.${pkgver}.tar.bz2
  msg2 'Correcting paths in html files'
  for j in $(ls $srcdir/*.html); do
    sed -i 's:/local0/docbuild/build/doc/en_US.ISO8859-1/books/developers-handbook/../../../share/images/books:/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books:g' $j        
  done     
}
package() {
  install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/developers-handbook
  cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/developers-handbook/
}
# vim:set ts=2 sw=2 et:
