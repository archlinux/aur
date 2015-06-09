# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
pkgname=emacs-haxe
pkgver=0.3.1
pkgrel=2
pkgdesc="Emacs major mode for the haXe programming language"
arch=('any')
url="http://haxe.org/com/ide"
license=('GPL')
depends=('emacs')
install=$pkgname.install
#source=(http://people.debian.org/~jps/misc/haxe-mode.el)
source=https://bitbucket.org/jpsecher/haxe-mode/raw/6f6d86720db37e44056786929c5a7fc5f115b7a8/haxe-mode.el
md5sums=('007e03613cc7dcdb69c85cdf568ac02c')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "haxe-mode.el"))' || return 1
  cp haxe-mode.el{,c} $startdir/pkg/usr/share/emacs/site-lisp || return 1
}
