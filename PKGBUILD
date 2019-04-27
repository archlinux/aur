# Contributor: sballert <sballert@posteo.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gituser="politza"
_gitrepo="tablist"

pkgname=emacs-tablist
pkgver=1.0
pkgrel=1
pkgdesc="Extended tabulated-list-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-tablist')
conflicts=('emacs-tablist')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9eb9f61e79736dd812c3e5d5e4aaa1c0d8f831f9b6e9739defcb372319cfaa18')

build() {
  cd "$_gitrepo"-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitrepo"-$pkgver
  install -d  "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
