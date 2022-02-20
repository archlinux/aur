# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-hexrgb
pkgver=1019
pkgrel=6
pkgdesc="Bookmark+ mode, which enhances vanilla Emacs bookmarks in many ways"
url="https://github.com/emacsmirror/hexrgb.git"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('awk' 'git')
source=("git+https://github.com/jousimies/hexrgb.git#commit=c14913d4b9ea78f26135af89c4cd6207e369755e")
md5sums=('SKIP')

pkgver() {
  cd hexrgb
  awk '/Update #:/ {print $4}' hexrgb.el
}

build() {
  cd hexrgb
  emacs -Q -batch -L . -f batch-byte-compile hexrgb.el || true
}

package() {
  cd hexrgb
  install -Dm644 hexrgb.el{,c} -t "${pkgdir}"/usr/share/emacs/site-lisp/
}
