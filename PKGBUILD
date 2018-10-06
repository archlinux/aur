# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ctable
pkgver=0.1.2
pkgrel=3
pkgdesc="Table Component for elisp"
url="https://github.com/kiwanami/emacs-ctable"
arch=('any')
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kiwanami/emacs-ctable/archive/${pkgver}.tar.gz")
sha256sums=('08da7bb579ef4c37cf972fd5cd9a5a990ed7220abe55fcfa0e27078c77c079d3')

build() {
  cd emacs-ctable-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile ctable*.el
}

package() {
  cd emacs-ctable-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 ctable*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
