# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=('emacs-rebol-mode')
url="http://www.rebol.com/tools/rebol.el"
license=('custom')
pkgrel=1
pkgver=1.0
pkgdesc="A major mode for editing Rebol programs"
install=$pkgname.install
depends=('emacs')
makedepends=('emacs' 'wget')
arch=('any')

build() {
  cd "$srcdir"

  #
  # BUILD HERE
  #
  if [ ! -f $(basename $url) ]; then
    wget $url
  fi
  emacs -batch -f batch-byte-compile rebol.el
}

package() {
  install -Dm644 rebol.el "$pkgdir/usr/share/emacs/site-lisp/rebol.el"
  install -Dm644 rebol.elc "$pkgdir/usr/share/emacs/site-lisp/rebol.elc"  
}

# vim:set ts=2 sw=2 et:
