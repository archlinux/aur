# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=slime-company
pkgver=1.1
pkgrel=1
pkgdesc="A company-mode completion backend for Slime"
url="https://github.com/anwyn/slime-company"
arch=('any')
license=('GPL3')
depends=('slime' 'emacs-company-mode')
source=("$pkgname-$pkgver.tar.gz::https://github.com/anwyn/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd $pkgname-$pkgver
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp
}
