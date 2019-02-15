# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=f.el
_pkgmaintainer=rejeep
pkgver=0.20.0
pkgrel=2
pkgdesc="Modern API for working with files and directories in Emacs"
pkgname=emacs-f
arch=('any')
url="https://github.com/${_pkgmaintainer}/f.el"
license=('GPL3')
depends=('emacs' 'emacs-s' 'emacs-dash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/f.el/archive/v${pkgver}.tar.gz")
sha256sums=('12aeec6c4e8b85fc9ab840365bce379d10257c383a1450d78f6fb1475f1b11da')

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}"/${_pkgsrcname}-${pkgver}
  mkdir -p "${pkgdir}"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp
}
