# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=emacs-let-alist
pkgver=1.0.4
pkgrel=1
pkgdesc="Easily let-bind values of an assoc-list by their names"
url="http://elpa.gnu.org/packages/let-alist.html"
arch=('any')
license=('')
depends=(emacs)
makedepends=(emacs)
source=(let-alist.el::http://elpa.gnu.org/packages/let-alist-1.0.4.el)
md5sums=('83d165daee025ab3872c39ab31577ee5')

build() {
  cd "$srcdir"
  emacs -batch -q -f batch-byte-compile let-alist.el
}

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/emacs/site-lisp
  install -Dm644 $srcdir/let-alist.{el,elc} $pkgdir/usr/share/emacs/site-lisp
}
