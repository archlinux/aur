# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer:xgdgsc <xgdgsc@gmail.com>

pkgname=emacs-multiple-cursors
_pkgname=multiple-cursors
pkgver=1.3.0
pkgrel=2
pkgdesc="Multiple cursors for Emacs"
arch=('any')
url="https://github.com/magnars/multiple-cursors.el"
license=('GPL3')
install=$pkgname.install
depends=('emacs')
source=("https://github.com/magnars/$_pkgname.el/archive/$pkgver.tar.gz")
md5sums=('b60faec04a10f911289cf40828c4ac80')

build() {
  cd $srcdir/$_pkgname.el-$pkgver/
  emacs -batch -f batch-byte-compile *.el
}

package() {
  cd $srcdir/$_pkgname.el-$pkgver/
  install -d -m755       $pkgdir/usr/share/emacs/site-lisp/multiple-cursors
  install    -m644 *.elc $pkgdir/usr/share/emacs/site-lisp/multiple-cursors/
}
