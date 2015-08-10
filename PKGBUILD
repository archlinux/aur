# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=emacs-evil
_emacs_pkgname=evil
pkgver=1.2.2
pkgrel=1
pkgdesc="An extensible vi layer for Emacs"
url="http://gitorious.org/evil/pages/Home"
arch=('any')
license=('GPLv2')
depends=('emacs' 'emacs-undo-tree')
source=("https://bitbucket.org/lyro/evil/get/${pkgver}.tar.gz")
sha256sums=('8cac5dc782f3b3f84a37c9d1162ec1d10a109e9b28512573781e1dd6173920ef')

build() {
  cd "${srcdir}/lyro-evil-"*
  make
}

package() {
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  cp -a "${srcdir}/lyro-evil-"*"/"*.el "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  cp -a "${srcdir}/lyro-evil-"*"/"*.elc "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
}
