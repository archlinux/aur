# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=queue
_pkgdestdirname=queue
pkgver=0.1.1
pkgrel=1
pkgdesc="Queue data structure"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://elpa.gnu.org/packages/${_pkgsrcname}.html"
license=('GPL3')
depends=('emacs')
source=("https://elpa.gnu.org/packages/${_pkgsrcname}-${pkgver}.el")
sha256sums=('210daf744931abd007e2ad0caae0990ecfa09b6509402b9c6238398bbb23824b')

build() {
  mv ${_pkgsrcname}-${pkgver}.el ${_pkgsrcname}.el
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
