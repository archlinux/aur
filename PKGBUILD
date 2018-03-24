# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-ats-mode
pkgver=20150609
pkgrel=2
pkgdesc="Major mode for ATS programming language."
arch=('any')
url="http://cs-people.bu.edu/md/ats-mode/"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source=("http://svn.code.sf.net/p/ats-lang/code/trunk/utils/emacs/ats-mode.el")
md5sums=('683253dcae2a69f6a99bc1af1a01c240')

build() {
  cd $srcdir
  emacs -batch -f batch-byte-compile $srcdir/ats-mode.el
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/ats-mode
  install -Dm644 ats-mode.el* $pkgdir/usr/share/emacs/site-lisp/ats-mode
}
