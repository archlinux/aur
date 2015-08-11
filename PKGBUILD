# Contributor: listx <linusarver <at> gmail <dot> com>
pkgname=emacs-undo-tree
pkgver=0.6.4
pkgrel=1
pkgdesc="Replace Emacs' undo system with an intuitive tree-based system."
arch=('any')
url="http://www.dr-qubit.org/emacs.php#undo-tree"
depends=('emacs')
license=('GPL')
provides=('emacs-undo-tree')
conflicts=('emacs-undo-tree')
install=$pkgname.install
source=(http://www.dr-qubit.org/undo-tree/undo-tree-${pkgver}.el)
sha1sums=('117764e599bcacd3e364e071854f53aeec33ef09')

build() {
  # rename to just undo-tree.el
  mv undo-tree-${pkgver}.el undo-tree.el
  # compile for speed
  emacs -batch -f batch-byte-compile undo-tree.el
}

package() {
  # create destination path
  install -d $pkgdir/usr/share/emacs/site-lisp
  # copy over file into path
  cp $srcdir/undo-tree.{el,elc} $pkgdir/usr/share/emacs/site-lisp
}
