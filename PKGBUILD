# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="emacs-lsp"
_gitrepo="lsp-mode"

pkgname=emacs-lsp-mode
pkgver=6.1
pkgrel=1
pkgdesc="Emacs client/library for the Language Server Protocol"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs-ht')
makedepends=('cask')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_gituser}/${_gitrepo}/archive/$pkgver.tar.gz")
sha256sums=('7c502ac206ea66b69f32015ac9e0e62a107bc8ecc2371756080914a561cae7e7')

build() {
  cd ${_gitrepo}-$pkgver
  cask build
}

package() {
  cd ${_gitrepo}-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
