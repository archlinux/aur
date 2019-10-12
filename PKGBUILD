# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=a.el
_pkgmaintainer=plexus
pkgver=0.1.1
pkgrel=1
pkgdesc="Clojure Parser for Emacs Lisp"
pkgname=emacs-a
arch=('any')
url="https://github.com/${_pkgmaintainer}/a.el"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/v${pkgver}.tar.gz")
sha256sums=('2998451375103630ceac2e3b8adc4522855aa890874b632e586632434dbd66a1')

build() {
  cd ${_pkgsrcname}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp
}
