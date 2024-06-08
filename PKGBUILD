# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=emacs-nyan-mode
pkgver=1.1.3
pkgrel=1
epoch=1
pkgdesc="Nyan Cat in your Emacs modeline"
arch=('any')
url="http://github.com/TeMPOraL/nyan-mode"
license=('GPL')
depends=('emacs')
install=emacs-nyan-mode.install
source=("$url/archive/v${pkgver}.tar.gz")
b2sums=('c138d6c9c29ecfa4f9ddf3ec27ceaf43cedddbda11d5a59c388ecd0c598c735f7ec9dfa99838a5ff2c521b096ef41e47c75199d4c2c225a278f6f1cd67684c82')

build() {
  cd "$srcdir/${pkgname/emacs-/}-${pkgver}"

  emacs -batch -f batch-byte-compile nyan-mode.el
}

package() {
  cd "$srcdir/${pkgname/emacs-/}-${pkgver}"

  install -Dm444 *.el* -t "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm444 img/* -t "$pkgdir/usr/share/emacs/site-lisp/img"
  install -Dm444 mus/* -t "$pkgdir/usr/share/emacs/site-lisp/mus"
}
