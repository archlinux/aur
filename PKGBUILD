# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-powerline
pkgver=2.4
pkgrel=1
pkgdesc="Emacs version of the Vim powerline."
arch=(any)
url="https://github.com/milkypostman/powerline"
license=('GPL3')
depends=('emacs')
source=("https://github.com/milkypostman/powerline/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/powerline-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/powerline-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/powerline/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/powerline/"
}
