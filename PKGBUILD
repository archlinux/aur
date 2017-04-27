# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-smex
pkgver=3.0
pkgrel=1
pkgdesc="A smart M-x enhancement for Emacs."
url="https://github.com/nonsequitur/smex"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-smex')
source=("https://github.com/nonsequitur/smex/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/smex-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/smex-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/smex"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/smex/"
}
