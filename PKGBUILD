# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=top-mode
_pkgdestdirname=top-mode
_versionprefix=
pkgver=2013_06_05.1
_pkgsrcver=master
pkgrel=1
pkgdesc="Run 'top' from emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://www.emacswiki.org/emacs/TopMode"
license=('GPL2')
depends=('emacs')
source=("https://github.com/emacsmirror/top-mode/archive/master.zip")
sha256sums=('15bb054e0447d6b557b70856fdba93382422f587dd0a01342930b3891377e4a3')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${_pkgsrcver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${_pkgsrcver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
