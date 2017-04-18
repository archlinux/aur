# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-expand-region
pkgver=0.11.0
pkgrel=2
pkgdesc="Emacs framework for incrementally selecting semantic regions"
url="https://github.com/magnars/expand-region.el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-expand-region')
source=("https://github.com/magnars/expand-region.el/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/expand-region.el-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/expand-region.el-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/expand-region"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/expand-region/"
}
