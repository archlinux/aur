# contributor: tantalum <tantalum at online dot de>
pkgname=sph-scheme-mode
pkgver=0.3
pkgrel=2
pkgdesc='emacs major mode for standard scheme editing'
arch=(any)
license=(gpl3)
depends=(emacs)
url=http://sph.mn
source=(http://files.sph.mn/s/computer/$pkgname.el)
md5sums=(21b3640ee3cb68190dd652c145a5f99c)

build() {
  p=$pkgname
  cd $srcdir
  emacs -q -no-site-file -batch -f batch-byte-compile $p.el || return 1
}

package() {
  p=$pkgname
  cd $srcdir
  install -D -m644 $p.elc "$pkgdir/usr/share/emacs/site-lisp/$pkgname.elc" || return 1
  install -D -m644 $p.el "$pkgdir/usr/share/emacs/site-lisp/$pkgname.el" || return 1
}