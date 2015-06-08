# Contributor: Cesar Romero <cesar.romero@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-psvn
pkgver=20130820
pkgrel=1
pkgdesc="Subversion interface for emacs"
url="http://www.emacswiki.org/cgi-bin/wiki/SubVersion"
license=('GPL2')
depends=('emacs')
install=$pkgname.install
source=(http://www.xsteve.at/prg/emacs/psvn.el)
md5sums=('41ca422b4f1ebba5276382a6d0aec317')
makedepends=('awk')
arch=('any')

#pkgver() {
  
build() {
  cd $srcdir
  emacs -batch -q -f batch-byte-compile psvn.el
}

package () {
  cd $srcdir
  install -Dm644 $srcdir/psvn.el \
    $pkgdir/usr/share/emacs/site-lisp/psvn.el 
  install -Dm644 $srcdir/psvn.elc \
    $pkgdir/usr/share/emacs/site-lisp/psvn.elc 
}
