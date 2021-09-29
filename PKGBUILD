# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-seq
pkgver=2.23
pkgrel=1
pkgdesc="Sequence manipulation functions, included in emacs 27"
_pkgname=seq
arch=(any)
url="http://elpa.gnu.org/packages/seq.html"
license=('GPL3')
depends=('emacs')
source=("https://elpa.gnu.org/packages/${_pkgname}-$pkgver.tar")
sha256sums=('5714abf7fc00aa74798741e7ebfe426ca777cd30e251ef5b9ae823847fb67dd1')

build() {
  cd ${_pkgname}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgname}-${pkgver}
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
