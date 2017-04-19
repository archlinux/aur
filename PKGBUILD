# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-evil-leader
pkgver=0.4.3
pkgrel=3
pkgdesc="Emacs framework for setting a vim-like prefix key"
url="https://github.com/cofi/evil-leader"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-evil')
makedepends=('git')
provides=('emacs-evil-leader')
source=("https://github.com/cofi/evil-leader/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/evil-leader-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/evil-leader-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/evil-leader"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/evil-leader"
}
