# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=linum-off.el
_pkgdestdirname=linum-off
_versionprefix=
pkgver=0.1
pkgrel=1
pkgdesc="Provides an interface for turning line-numbering off"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://www.emacswiki.org/emacs/linum-off.el"
license=('GPL3')
depends=('emacs')
source=("http://www.emacswiki.org/emacs/download/${_pkgsrcname}")
sha256sums=('0cbeea5eb236c52655d9b9966a55c9073cd0e7a776bb999fef369e753ff9e19f')
install=${pkgname}.install

build() {
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
