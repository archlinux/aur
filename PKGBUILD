# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="tigersoldier"
_gitrepo="company-lsp"

pkgname=emacs-company-lsp
pkgver=2.1.0
pkgrel=1
pkgdesc="Company completion backend for lsp-mod"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-company-mode' 'emacs-dash' 'emacs-lsp-mode' 'emacs-s')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd ${_gitrepo}-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_gitrepo}-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
