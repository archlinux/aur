# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-seq
pkgver=2.22
pkgrel=1
pkgdesc="Sequence manipulation functions, included in emacs 27"
_pkgname=seq
arch=(any)
url="http://elpa.gnu.org/packages/seq.html"
license=('GPL3')
depends=('emacs')
source=("https://elpa.gnu.org/packages/${_pkgname}-$pkgver.tar")
sha256sums=('aae6979ce7db370181da3c16f7033fb3bcd5c8a1a2e568c6cb0cc9bfd462987e')

build() {
  cd ${_pkgname}-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgname}-${pkgver}
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
