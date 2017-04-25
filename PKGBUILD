# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-moe-theme
pkgver=20170111.1838
pkgrel=1
pkgdesc="A customizable colorful eye-candy theme for Emacser. Moe, moe, kyun!"
arch=(any)
url="https://github.com/kuanyui/moe-theme.el"
license=('GPL3')
depends=('emacs')
optdepends=('emacs-powerline: Powerline support')
source=("https://github.com/kuanyui/moe-theme.el/archive/master.zip")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/moe-theme.el-master"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/moe-theme.el-master"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/moe-theme/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/moe-theme/"
}
