# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-s
pkgver=1.11.0
pkgrel=1
pkgdesc="The long lost Emacs string manipulation library."
arch=(any)
url="https://github.com/magnars/s.el"
license=('GPL3')
depends=('emacs')
source=("https://github.com/magnars/s.el/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/s.el-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/s.el-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/s/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/s/"
}
