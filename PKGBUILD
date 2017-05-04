# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-auto-complete
pkgver=1.5.1
pkgrel=1
pkgdesc="A auto-complete declaration for simplifying your .emacs"
url="https://github.com/auto-complete/auto-complete"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-popup-el' 'emacs-fuzzy')
makedepends=('git')
provides=('emacs-auto-complete')
source=("https://github.com/auto-complete/auto-complete/archive/v${pkgver}.tar.gz")
sha256sums=('1bfb4351c3e49681a875dab937c25b6b38e4bf8a8cd64bcba1954300242578cb')
install=${pkgname}.install

build() {
  cd "${srcdir}/auto-complete-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/auto-complete-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/auto-complete"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/auto-complete/"
}
