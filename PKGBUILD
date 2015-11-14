# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=emacs-evil
_emacs_pkgname=evil
pkgver=1.2.8
pkgrel=1
pkgdesc="An extensible vi layer for Emacs"
url="http://gitorious.org/evil/pages/Home"
arch=('any')
license=('GPLv2')
depends=('emacs' 'emacs-undo-tree')
source=("https://bitbucket.org/lyro/evil/get/${pkgver}.tar.gz")
sha256sums=('98cd73042ad75059c42ac1674a12a6afacd9531541f34bf1843d4baaef462879')

build() {
  cd "${srcdir}/lyro-evil-"*
  make
}

package() {
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  cp -a "${srcdir}/lyro-evil-"*"/"*.el "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  cp -a "${srcdir}/lyro-evil-"*"/"*.elc "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
}
