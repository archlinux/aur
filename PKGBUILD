# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="emacs-lsp"
_gitrepo="lsp-ui"

pkgname=emacs-lsp-ui
pkgver=6.2
pkgrel=1
pkgdesc="UI modules for lsp-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-dash' 'flycheck' 'emacs-lsp-mode' 'emacs-markdown-mode')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_gituser}/${_gitrepo}/archive/$pkgver.tar.gz")
md5sums=('1572cd81519eb8d824e91227597bfc9b')

build() {
  cd ${_gitrepo}-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${_gitrepo}-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
