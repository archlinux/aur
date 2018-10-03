# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-commander
pkgver=0.7.0
pkgrel=1
pkgdesc="Command line parsing for emacs"
arch=('any')
url="https://github.com/rejeep/commander.el.git"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rejeep/commander.el/archive/v$pkgver.tar.gz")
sha256sums=('5eb0f7f016b484ffc91bcd54ced1b0455667e5ee93077a92eafc9d5f4214daa4')

build() {
  cd commander.el-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd commander.el-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
