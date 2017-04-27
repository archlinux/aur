# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-jedi
pkgver=0.2.7
pkgrel=1
pkgdesc="Python auto-completion for Emacs"
url="https://github.com/tkf/emacs-jedi"
arch=('any')
license=('GPL3')
depends=('emacs' 'python-jedi' 'emacs-auto-complete' 'emacs-epc' 'emacs-python-environment')
makedepends=('git')
provides=('emacs-jedi')
source=("https://github.com/tkf/emacs-jedi/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emacs-jedi-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile jedi*.el
}

package() {
  cd "${srcdir}/emacs-jedi-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/jedi"
  install -m644 jedi*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/jedi/"
}
