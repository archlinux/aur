# Contributor: Geoffrey Teale <tealeg@member.fsf.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=quack  
pkgver=0.48
pkgrel=2
pkgdesc="[Emacs] enhanced support for editing and running Scheme code."
url="http://www.neilvandyke.org/quack"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('emacs')
install=quack.install
source=("http://www.neilvandyke.org/${pkgname}/${pkgname}.el")
md5sums=('3008dadfd1cbfcf5671f788bd5a8e085')
EMACS=emacs # or sxemacs, or xemacs

build() {
  $EMACS --batch --eval '(byte-compile-file "quack.el")'
}

package() {
  install -Dm644 $pkgname.el $pkgdir/usr/share/$EMACS/site-lisp/$pkgname.el
  install -Dm644 $pkgname.elc $pkgdir/usr/share/$EMACS/site-lisp/$pkgname.elc
}
