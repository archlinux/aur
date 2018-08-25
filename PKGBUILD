# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-fuzzy
pkgver=0.1
pkgrel=2
pkgdesc="Fuzzy matching utilities for GNU Emacs"
url="https://github.com/auto-complete/fuzzy-el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-fuzzy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auto-complete/fuzzy-el/archive/v${pkgver}.tar.gz")
sha256sums=('deef66b905ca73c78149c3c29413a8eecaf23f3e87b9d24fab824f3f464585f8')

build() {
  cd fuzzy-el-${pkgver}
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd fuzzy-el-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/fuzzy
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/fuzzy/
}
