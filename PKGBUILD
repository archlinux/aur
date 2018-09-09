# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-paredit
pkgver=24
_pkgname=paredit
pkgrel=2
pkgdesc="Emacs minor mode for pseudo-structurally editing Lisp code"
arch=('any')
url="http://www.emacswiki.org/emacs/ParEdit"
license=('GPL')
conflicts=('paredit')
provides=('paredit')
makedepends=('emacs')
install=paredit.install
source=("http://mumble.net/~campbell/emacs/${_pkgname}-${pkgver}.el")
sha256sums=('6a1ead320d0fc3032d0359e6f66e3b62b065eea71f70a5315de0b06930b2e35e')

build() {
  cd "$srcdir"
  emacs -Q -batch -f batch-byte-compile paredit-${pkgver}.el
}

package() {
  cd "$srcdir"

  install -D -m644 paredit-${pkgver}.elc \
    "$pkgdir"/usr/share/emacs/site-lisp/paredit.elc
  install -D -m644 paredit-${pkgver}.el \
    "$pkgdir"/usr/share/emacs/site-lisp/paredit.el
}

