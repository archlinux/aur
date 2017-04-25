# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-font-lock-plus
pkgver=208
pkgrel=1
pkgdesc="Enhancements to standard library 'font-lock.el'."
url="https://www.emacswiki.org/emacs/font-lock%2B.el"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('git')
provides=('emacs-font-lock-plus')
source=("https://github.com/emacsmirror/font-lock-plus/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/font-lock-plus-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/font-lock-plus-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/font-lock-plus/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/font-lock-plus/"
}
