# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=freebsd-docs-committers-guide
pkgver=51202
pkgrel=1
pkgdesc="The Committer's Guide from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/articles/committers-guide/article.html-split.tar.bz2")
sha256sums=('11aeb7a0784d01b6b85499846de6486e997853eb60e184c67fc09e790d027162')

prepare() {
  rm $srcdir/article.html-split.tar.bz2
  msg2 'Correcting paths in html files'
  for j in $(ls $srcdir/*.html); do
    sed -i 's:/local0/docbuild/build/:/usr/share/doc/freebsd/:g' $j        
  done        
}

package() {
  install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/articles/committers-guide
  cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/articles/committers-guide/
}
# vim:set ts=2 sw=2 et:
