# Maintainer: Nathan Owe <nathan.aur at gmail dot com>
pkgname=emacs-rtf-mode
pkgver=1.1
pkgrel=2
pkgdesc="Emacs mode for viewing/editing RTF files"
arch=('any')
url="http://www.emacswiki.org/emacs/rtf-mode.el"
license=('GPL')
depends=('emacs')
source=("http://www.emacswiki.org/emacs/download/rtf-mode.el")
md5sums=('e03cfb1b4176e4795b1d36cfea6d1acc')

build() {
  cd "$srcdir/"
  emacs -batch -f batch-byte-compile rtf-mode.el
  }
package() {
  cd "$srcdir/"
  install -Dm644 rtf-mode.el \
    "$pkgdir/usr/share/emacs/site-lisp/rtf-mode.el"
  install -Dm644 rtf-mode.elc \
    "$pkgdir/usr/share/emacs/site-lisp/rtf-mode.elc"
}
