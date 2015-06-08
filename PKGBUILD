# Contributor: Pierre Neidhardt <ambrevar at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_name=xclip
pkgname=emacs-$_name
pkgver=0.9
pkgrel=1
pkgdesc="Emacs interface to xclip"
arch=('any')
url="http://www.emacswiki.org/emacs/xclip.el"
license=('GPL3')
makedepends=('emacs')
install=$pkgname.install
source=(http://www.emacswiki.org/emacs/download/$_name.el)
sha1sums=('c4c4167405702b8f747f0ebd9b962ba075bdbeb8')

build() {
  emacs --batch --no-site-file -f batch-byte-compile $_name.el
}

package() {
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -Dm644 ${_name}.el{c,} $pkgdir/usr/share/emacs/site-lisp/
}
