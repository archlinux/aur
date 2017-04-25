# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-multi-term
pkgver=1.3
pkgrel=1
pkgdesc="Managing multiple terminal buffers in Emacs."
url="https://www.emacswiki.org/emacs/MultiTerm"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-multi-term')
source=("https://www.emacswiki.org/emacs/download/multi-term.el")
sha256sums=('SKIP')

build() {
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  install -d "${pkgdir}/usr/share/emacs/site-lisp/multi-term"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/multi-term/"
}
