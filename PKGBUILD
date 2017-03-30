# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=emacs-nyan-mode
pkgver=1.1.1
pkgrel=1
epoch=1
pkgdesc="Nyan Cat in your Emacs modeline"
arch=('any')
url="http://github.com/TeMPOraL/nyan-mode"
license=('GPL')
depends=('emacs')
install=emacs-nyan-mode.install
source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('9685c5dcb2f3125e1b00fa2be5a9bd2a27e596fa6b4a0501d0a4ed99a445749f88b00be7a5a8fd2afa217a023d1335cfcab79c6fb13b4e9eeef28032050d14f5')

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
