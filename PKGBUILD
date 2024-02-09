# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
pkgname=emacs-haxe
pkgver=0.3.3
pkgrel=1
pkgdesc="Emacs major mode for the haXe programming language"
arch=('any')
url="http://haxe.org/com/ide"
license=('GPL')
depends=('emacs')
install=$pkgname.install
#source=(http://people.debian.org/~jps/misc/haxe-mode.el)
source=(https://raw.githubusercontent.com/emacsorphanage/haxe-mode/0.3.3/haxe-mode.el)
md5sums=('9f322aa78c9fad5c390267e6c8b6a5d7')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "haxe-mode.el"))' || return 1
  cp haxe-mode.el{,c} $pkgdir/usr/share/emacs/site-lisp || return 1
}
