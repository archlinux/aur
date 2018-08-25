# Maintainer: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-neotree
pkgver=0.5.2
pkgrel=1
pkgdesc="A emacs tree plugin like NerdTree for Vim."
arch=(any)
url="https://github.com/jaypei/emacs-neotree"
license=('GPL3')
depends=('emacs')
source=("https://github.com/jaypei/emacs-neotree/archive/${pkgver}.tar.gz")
sha256sums=('22dc07fc170ebb2c69353fcd4680a06824fd42b9cc41f6e6715646cf216ba6fd')

build() {
  cd "${srcdir}/emacs-neotree-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/emacs-neotree-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/neotree/icons/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/neotree/"
  install -m644 icons/*.xpm "${pkgdir}/usr/share/emacs/site-lisp/neotree/icons/"
}
