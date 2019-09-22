# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-symbols-mode-git
pkgver=0.3
pkgrel=3
pkgdesc="GNU Emacs major mode for listing symbols from object files"
arch=('any')
url="https://github.com/stefanhusmann/emacs-symbols-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://gitlab.com/stefanhusmann/emacs-symbols-mode.git")
md5sums=('SKIP')
_gitname="emacs-symbols-mode"

build() {
  cd $_gitname
  emacs -batch -q -f batch-byte-compile symbols-mode.el
}

package() {
  cd $_gitname
  install -Dm644 symbols-mode.el \
    $pkgdir/usr/share/emacs/site-lisp/symbols-mode.el
  install -Dm644 symbols-mode.elc \
    $pkgdir/usr/share/emacs/site-lisp/symbols-mode.elc
}
