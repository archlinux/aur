# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-iedit
pkgver=0.9.9.9
pkgrel=1
pkgdesc="Edit multiple regions with the same content simultaneously"
arch=(any)
url="https://github.com/victorhge/iedit"
license=('GPL3')
depends=('emacs')
source=("https://github.com/victorhge/iedit/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/iedit-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile iedit{-lib,-rect,}*.el
}

package() {
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/iedit/"
  cd "${srcdir}/iedit-${pkgver}"
  install -m644 iedit{-lib,-rect,}.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/iedit/"
}
