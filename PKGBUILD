# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=emacs-evil
_emacs_pkgname=evil
pkgver=1.2.12
pkgrel=1
pkgdesc="An extensible vi layer for Emacs"
url="https://www.emacswiki.org/emacs/Evil"
arch=('any')
license=('GPLv2')
depends=('emacs' 'emacs-undo-tree')
source=("https://bitbucket.org/lyro/evil/get/${pkgver}.tar.gz")
sha256sums=('cb9641195b825067c0109ac74f1cb183e652383f269dfe4b2147d27e867ddb74')

build() {
  cd "${srcdir}/lyro-evil-"*
  make
}

package() {
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  cp -a "${srcdir}/lyro-evil-"*"/"*.el "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  cp -a "${srcdir}/lyro-evil-"*"/"*.elc "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
}
