# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=emacs-julia-mode
pkgver=0.3.1
pkgrel=2
pkgdesc="Emacs major mode for the Julia programming language"
arch=('any')
url="http://www.julialang.org"
license=('GPL')
depends=('emacs')
install=$pkgname.install
source='https://raw.githubusercontent.com/JuliaLang/julia/master/contrib/julia-mode.el'
md5sums=('be9be3a7b7e549b41674551f34b83ebf')
_el="${pkgname#emacs-}.el"

build() {
  cd $srcdir
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "julia-mode.el"))'
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -m644 $srcdir/${_el} $pkgdir/usr/share/emacs/site-lisp
  install -m644 $srcdir/${_el}c $pkgdir/usr/share/emacs/site-lisp
}
