# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-bash-completion
pkgver=2.0.0
pkgrel=1
pkgdesc="Add programmable bash completion to Emac's shell-mode"
url="https://github.com/szermatt/emacs-bash-completion"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('git')
provides=('emacs-bash-completion')
source=("https://github.com/szermatt/emacs-bash-completion/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emacs-bash-completion-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile bash-completion.el
}

package() {
  cd "${srcdir}/emacs-bash-completion-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/bash-completion"
  install -m644 bash-completion.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/bash-completion/"
}
