# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-iedit
pkgver=0.90
pkgrel=1
pkgdesc="Edit multiple regions with the same content simultaneously"
arch=(any)
url="https://github.com/tsdh/iedit"
license=('GPL3')
depends=('emacs')
source=("https://github.com/tsdh/iedit/archive/${pkgver}.tar.gz")                                                              
sha256sums=('SKIP')

build() {
  cd "${srcdir}/iedit-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/iedit-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/iedit/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/iedit/"
}
