# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-ag
pkgver=0.47
pkgrel=1
pkgdesc="An Emacs frontend to The Silver Searcher"
arch=(any)
url="https://github.com/Wilfred/ag.el"
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-s')
source=("https://github.com/Wilfred/ag.el/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/ag.el-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/ag.el-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/ag/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/ag/"
}
