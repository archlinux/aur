# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=transient
_pkgmaintainer=magit
pkgver=0.3.5
pkgrel=1
pkgdesc="Implements prefix commands, infix arguments and suffix commands."
pkgname=emacs-transient
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs-dash' 'emacs-hydra')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/v${pkgver}.tar.gz")
sha256sums=('f1d8f641d9e3b4ee1fb7e92842a8ab56f25b1f5d32df73b517b1afbb93e30805')

build() {
  cd ${_pkgsrcname}-${pkgver}/lisp
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_pkgsrcname}-${pkgver}/lisp
  install -Dm644 *.el{c,} -t "$pkgdir"/usr/share/emacs/site-lisp/
}
