# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="emacs-lsp"
_gitrepo="lsp-mode"

pkgname=emacs-lsp-mode
pkgver=6.2
pkgrel=1
pkgdesc="Emacs client/library for the Language Server Protocol"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs-ht')
makedepends=('cask')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_gituser}/${_gitrepo}/archive/$pkgver.tar.gz")
sha256sums=('4500039e8c1c37c5ba1f9ae11626c824657f371cfabf72bfe495a4ea30636058')

build() {
  cd ${_gitrepo}-$pkgver
  cask build
}

package() {
  cd ${_gitrepo}-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
