# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-golden-ratio
pkgver=1.0
pkgrel=1
pkgdesc="Automatic resizing of Emacs windows to the golden ratio"
url="https://github.com/roman/golden-ratio.el"
arch=('any')
license=('MIT')
depends=('emacs')
makedepends=('git')
provides=('emacs-golden-ratio')
source=("https://github.com/roman/golden-ratio.el/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/golden-ratio.el-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/golden-ratio.el-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/golden-ratio"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/golden-ratio/"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
