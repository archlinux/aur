# See AUR interface for current maintainer.
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>
pkgname=emacs-sml-mode
pkgver=6.7
pkgrel=1
pkgdesc="An SML editing mode for emacs"
arch=(any)
url="http://elpa.gnu.org/packages/sml-mode.html"
license=('GPL3')
depends=(emacs)
makedepends=()
install=emacs-sml-mode.install
source=("http://elpa.gnu.org/packages/sml-mode-$pkgver.el")
sha256sums=('3db9673b7c23e3ee58d8f0e748871700125fa0e44cdf14754a3ed6787aaf2d10')

build() {
  cd "$srcdir"
  mv sml-mode-$pkgver.el sml-mode.el
  emacs -batch -f batch-byte-compile sml-mode.el
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 sml-mode.el sml-mode.elc "$pkgdir/usr/share/emacs/site-lisp"
}

# vim:set ts=2 sw=2 et:
