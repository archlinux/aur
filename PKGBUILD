# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=emacs-evil
_emacs_pkgname=evil
pkgver=1.2.12
pkgrel=2
pkgdesc="An extensible vi layer for Emacs"
url="https://www.emacswiki.org/emacs/Evil"
arch=('any')
license=('GPLv2')
depends=('emacs' 'emacs-undo-tree')
source=("https://github.com/emacs-evil/evil/archive/${pkgver}.tar.gz")
sha256sums=('035d2257e39819dc769ee069ef163dc22edfa40eb81842967539c2111475f7b8')

build() {
  cd "${srcdir}/evil-${pkgver}"
  make
}

package() {
  cd "${srcdir}/evil-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_emacs_pkgname}"
}
