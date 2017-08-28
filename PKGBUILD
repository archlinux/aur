# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=midje-mode
_pkgdestdirname=midje-mode
pkgver=20170808.2103
pkgrel=1
pkgdesc="Emacs mode for the Midje test framework"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/dnaumov/midje-mode"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://melpa.org/packages/${_pkgsrcname}-${pkgver}.tar")
sha256sums=('fa0fd2a54a6f846ce4f88173bbcbaf01b155e598b7c54850ca65209aa7e1ebe2')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
