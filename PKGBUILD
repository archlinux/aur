# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-whitespace-mode
pkgver=20150609
pkgrel=2
pkgdesc="Major mode for editing Whitespace (an esoteric programming language)."
arch=('any')
url="https://hackage.haskell.org/package/whitespace"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source=("https://github.com/haroldl/whitespace-nd/raw/main/emacs/whitespace-mode.el")
md5sums=('8199a6bd2f6d8a1e619cba6ab7f31ee3')

build() {
  cd $srcdir
  emacs -batch -f batch-byte-compile $srcdir/whitespace-mode.el
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/whitespace-mode
  install -Dm644 whitespace-mode.el whitespace-mode.elc $pkgdir/usr/share/emacs/site-lisp/whitespace-mode
}
