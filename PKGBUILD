# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-evil-surround
pkgver=1.0.0
pkgrel=1
pkgdesc="you will be surrounded (surround.vim for evil, the extensible vi layer)"
url="https://github.com/timcharper/evil-surround"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil')
makedepends=('git')
provides=('emacs-evil-surround')
source=("https://github.com/timcharper/evil-surround/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/evil-surround-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/evil-surround-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/evil-surround"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/evil-surround/"
}
