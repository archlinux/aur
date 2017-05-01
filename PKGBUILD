# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-evil-iedit-state
pkgver=1.1
pkgrel=1
pkgdesc="Slick Evil states for iedit."
arch=(any)
url="https://github.com/syl20bnr/evil-iedit-state"
license=('GPL3')
depends=('emacs' 'emacs-evil' 'emacs-iedit')
optdepends=('emacs-expand-region: Integration with expand-region')
source=("https://github.com/syl20bnr/evil-iedit-state/archive/v${pkgver}.tar.gz")                                                              
sha256sums=('SKIP')

build() {
  cd "${srcdir}/evil-iedit-state-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/evil-iedit-state-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/evil-iedit-state/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/evil-iedit-state/"
}
