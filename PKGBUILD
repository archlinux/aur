# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="emacs-lsp"
_gitrepo="lsp-mode"

pkgname=emacs-lsp-mode
pkgver=6.2.1
pkgrel=2
pkgdesc="Emacs client/library for the Language Server Protocol"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs-ht' 'emacs-f')
makedepends=('cask')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_gituser}/${_gitrepo}/archive/$pkgver.tar.gz")
sha256sums=('3a677d002b71663fa10cfe761b737d854fd0276e81df68550d6d7eb413d9399d')

build() {
  cd ${_gitrepo}-$pkgver
  cask build
}

package() {
  cd ${_gitrepo}-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
