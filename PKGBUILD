# Contributor: Geoffrey Teale <tealeg@member.fsf.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=quack  
pkgver=0.48
pkgrel=1
pkgdesc="[Emacs] enhanced support for editing and running Scheme code."
url="http://www.neilvandyke.org/quack"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('emacs')
install=quack.install
source=("http://www.neilvandyke.org/${pkgname}/${pkgname}.el")
md5sums=('73482065ce28e13401413f91b8619e2a')
EMACS=emacs # or sxemacs, or xemacs

build() {
  $EMACS --batch --eval '(byte-compile-file "quack.el")'
}

package() {
  install -Dm644 $pkgname.el $pkgdir/usr/share/$EMACS/site-lisp/$pkgname.el
  install -Dm644 $pkgname.elc $pkgdir/usr/share/$EMACS/site-lisp/$pkgname.elc
}
