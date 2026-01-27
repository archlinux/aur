# Contributor: Jon Eyolfson <jon@eyolfson.com>
pkgname=emacs-evil
_emacs_pkgname=evil
pkgver=1.14.2
pkgrel=1
pkgdesc="An extensible vi layer for Emacs"
url="https://www.emacswiki.org/emacs/Evil"
arch=('any')
license=('GPLv2')
depends=('emacs' 'emacs-undo-tree')
source=("https://github.com/emacs-evil/evil/archive/${pkgver}.tar.gz")
sha256sums=('ed7e9b034a48ac62e839ef97abb75c7590b149899fdad01f3d330a23b9d8132a')

build() {
  cd "${srcdir}/evil-${pkgver}"
  make
}

package() {
  cd "${srcdir}/evil-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
}
