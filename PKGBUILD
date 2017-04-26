# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-fuzzy
pkgver=0.1
pkgrel=1
pkgdesc="Fuzzy matching utilities for GNU Emacs"
url="https://github.com/auto-complete/fuzzy-el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-fuzzy')
source=("https://github.com/auto-complete/fuzzy-el/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/fuzzy-el-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/fuzzy-el-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/fuzzy"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/fuzzy/"
}
