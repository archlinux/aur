# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-fuzzy
pkgver=0.3
pkgrel=1
pkgdesc="Fuzzy matching utilities for GNU Emacs"
url="https://github.com/auto-complete/fuzzy-el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-fuzzy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auto-complete/fuzzy-el/archive/v${pkgver}.tar.gz")
sha256sums=('17574b439bb041f097ec4ded9cd2aa26b6a8b499250a159c601dd56a2f80be58')

build() {
  cd fuzzy-el-${pkgver}
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd fuzzy-el-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/fuzzy
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/fuzzy/
}
