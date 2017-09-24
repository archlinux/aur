# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=emacs-sml-mode
pkgver=6.7
pkgrel=2
pkgdesc="An emacs editing mode for Standard ML"
arch=(any)
url="http://elpa.gnu.org/packages/sml-mode.html"
license=('GPL3')
depends=(emacs)
install=$pkgname.install
source=("http://elpa.gnu.org/packages/${pkgname#emacs-}-$pkgver.el")
sha256sums=('3db9673b7c23e3ee58d8f0e748871700125fa0e44cdf14754a3ed6787aaf2d10')

build() {
  cd "$srcdir"
  emacs -batch -f batch-byte-compile ${pkgname#emacs-}-$pkgver.el
}

package() {
  cd "$srcdir"
  install -Dm644 ${pkgname#emacs-}-$pkgver.el "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
  install -Dm644 ${pkgname#emacs-}-$pkgver.elc "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
}
