# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-persp-mode
pkgver=2.9.6
pkgrel=1
pkgdesc="Named perspectives(set of buffers/window configs) for emacs"
arch=(any)
url="https://github.com/Bad-ptr/persp-mode.el"
license=('GPL3')
depends=('emacs')
optdepends=('emacs-workgroups: Needed to save perspectives to disk with emacs < 24.4')
source=("https://github.com/Bad-ptr/persp-mode.el/archive/v${pkgver}.tar.gz")                                                              
sha256sums=('SKIP')

build() {
  cd "${srcdir}/persp-mode.el-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/persp-mode.el-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/persp-mode/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/persp-mode/"
}
