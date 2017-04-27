# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-ctable
pkgver=0.1.2
pkgrel=1
pkgdesc="Table Component for elisp"
url="https://github.com/kiwanami/emacs-ctable"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-ctable')
source=("https://github.com/kiwanami/emacs-ctable/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emacs-ctable-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile ctable*.el
}

package() {
  cd "${srcdir}/emacs-ctable-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/ctable"
  install -m644 ctable*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/ctable/"
}