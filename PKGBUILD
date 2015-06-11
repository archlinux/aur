# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=paredit
pkgver=24
_pkgver=$pkgver
pkgrel=1
pkgdesc="Emacs minor mode for pseudo-structurally editing Lisp code"
arch=('any')
url="http://www.emacswiki.org/emacs/ParEdit"
license=('GPL')
makedepends=('emacs')
install=paredit.install
source=("http://mumble.net/~campbell/emacs/$pkgname-${_pkgver}.el")
sha256sums=('6a1ead320d0fc3032d0359e6f66e3b62b065eea71f70a5315de0b06930b2e35e')

build() {
  cd "$srcdir"
  emacs -Q -batch -f batch-byte-compile paredit-${_pkgver}.el
}

package() {
  cd "$srcdir"

  install -D -m644 paredit-${_pkgver}.elc \
    "$pkgdir/usr/share/emacs/site-lisp/paredit.elc" || return 1
  install -D -m644 paredit-${_pkgver}.el \
    "$pkgdir/usr/share/emacs/site-lisp/paredit.el" || return 1
}

