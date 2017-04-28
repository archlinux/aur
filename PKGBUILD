# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-workgroups
pkgver=0.2.0
pkgrel=1
pkgdesc="Workgroups for windows -- sexy window management for emacs"
arch=(any)
url="https://github.com/tlh/workgroups.el"
license=('GPL2')
depends=('emacs')
source=("https://github.com/tlh/workgroups.el/archive/master.zip")                                                              
sha256sums=('SKIP')

build() {
  cd "${srcdir}/workgroups.el-master"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/workgroups.el-master"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/workgroups/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/workgroups/"
}
