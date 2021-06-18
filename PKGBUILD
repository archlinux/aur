# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>


_pkgsrcname=anzu
_pkgmaintainer=emacsorphanage
_pkgdestdirname=anzu
_versionprefix=
pkgver=0.64
pkgrel=1
pkgdesc="Minor mode which displays current match and total matches information in the mode-line"
pkgname=emacs-${_pkgdestdirname}
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('19556e888a47e43d8d917b427e484517fa668dcdd4d6d7bbbfe13f2118520b6e')
install=${pkgname}.install

build() {
  cd ${_pkgsrcname}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
