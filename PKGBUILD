# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-company-mode
pkgver=0.9.3
pkgrel=1
pkgdesc="Modular in-buffer completion framework for Emacs"
url="http://company-mode.github.io"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-company-mode')
source=("https://github.com/company-mode/company-mode/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/company-mode-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/company-mode-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/company-mode"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/company-mode/"
}
