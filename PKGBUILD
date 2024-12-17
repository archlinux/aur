# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=queue
_pkgdestdirname=queue
pkgver=0.2
pkgrel=2
pkgdesc="Queue data structure"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://elpa.gnu.org/packages/${_pkgsrcname}.html"
license=('GPL3')
depends=('emacs')
source=("https://elpa.gnu.org/packages/${_pkgsrcname}-${pkgver}.tar")
sha256sums=('880dc17566232e7b1d4b2298906d153a971971ded7a250cdd5fac056a836ef84')

build() {
  tar xf ${_pkgsrcname}-${pkgver}.tar
  cd ${_pkgsrcname}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/${_pkgdestdirname}/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_pkgdestdirname}/
}
