# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-hexrgb
pkgver=1019
pkgrel=3
pkgdesc="Bookmark+ mode, which enhances vanilla Emacs bookmarks in many ways"
url="http://www.emacswiki.org/emacs/BookmarkPlus"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('awk')
source=("git+https://github.com/emacsmirror/hexrgb.git#commit=90e5f07f14bdb9966648977965094c75072691d4")
md5sums=('SKIP')

pkgver() {
  awk '/Update #:/ {print $4}' hexrgb.el
}

build() {
  emacs -Q -batch -L . -f batch-byte-compile hexrgb.el || true
}

package() {
  install -Dm644 hexrgb.el{,c} -t "${pkgdir}"/usr/share/emacs/site-lisp/
}
