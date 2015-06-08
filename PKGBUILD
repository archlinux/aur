# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-escreen  
pkgver=1.18
pkgrel=1
_emacs=emacs
pkgdesc="Window configuration management for emacs"
url="http://www.splode.com/~friedman/software/emacs-lisp/#ui"
arch=('i686' 'x86_64')
license=('GPL')
depends=('emacs')
install=escreen.install
source=(http://www.splode.com/~friedman/software/emacs-lisp/src/escreen.el dotemacs)
md5sums=('51d8040fb0fa0ab6f8be7d6785cee0c0'
         '41c28902d9d9ff178e0048418af2b972')
build() {
  cd $srcdir
  $_emacs -batch -q -f batch-byte-compile escreen.el 
}
package() {
  install -Dm644 $srcdir/escreen.el \
    $pkgdir/usr/share/${_emacs}/site-lisp/escreen.el
  install -Dm644 $srcdir/escreen.elc \
    $pkgdir/usr/share/${_emacs}/site-lisp/escreen.elc 
  install -Dm644 dotemacs $pkgdir/usr/share/doc/emacs-escreen/dotemacs
}
