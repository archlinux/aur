# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="emacs-lsp"
_gitrepo="lsp-mode"

pkgname=emacs-lsp-mode
pkgver=6.0
pkgrel=1
pkgdesc="Emacs client/library for the Language Server Protocol"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_gituser}/${_gitrepo}/archive/$pkgver.tar.gz")
sha256sums=('586e08d61b75c9008ba7bdb38b08e0536d3c6d98ba93f4fe6839109d8cf94842')

build() {
  cd ${_gitrepo}-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_gitrepo}-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
