# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=parseedn
_pkgmaintainer=clojure-emacs
pkgver=0.2.0
pkgrel=1
pkgdesc="Clojure/EDN parser for elisp"
pkgname=emacs-parseedn
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs-a' 'emacs-parseclj')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/v${pkgver}.tar.gz")
sha256sums=('3d8ef419ddb4d488064ea2238deba4a9de689b2a8873d50fe5588683db11bb53')

build() {
  cd ${_pkgsrcname}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp
}
