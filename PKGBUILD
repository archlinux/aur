# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-iedit
pkgver=0.9.9.9.9
pkgrel=1
pkgdesc="Edit multiple regions with the same content simultaneously"
arch=('any')
url="https://github.com/victorhge/iedit"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/victorhge/iedit/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd iedit-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile iedit{-lib,-rect,}*.el
}

package() {
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/iedit/
  cd iedit-$pkgver
  install -m644 iedit{-lib,-rect,}.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/iedit/
}
