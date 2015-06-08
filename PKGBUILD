# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
# Maintainer Stefan Husmann < stefan-husmann@t-online.de>
pkgname=emacs-elscreen-dired
pkgver=0.1.0
pkgrel=1
pkgdesc="Frame configuration management for GNU Emacs modelled after GNU Screen"
arch=('any')
url="http://www.morishima.net/~naoto/software/elscreen/index.php.en"
license=('GPL')
depends=('emacs-elscreen')
makedepends=('emacs-apel')
source=(ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/${pkgname#emacs-}-$pkgver.tar.gz
)
md5sums=('ec9166b97381eab2d0e5388aa3af19d1')

build() {
  cd $srcdir/${pkgname#emacs-}-$pkgver
  emacs --batch --eval "(progn
			  (push \".\" load-path)
			  (byte-compile-file \"${pkgname#emacs-}.el\"))"
}
package () {
  cd $srcdir/${pkgname#emacs-}-$pkgver
  install -d $pkgdir/usr/share/emacs/site-lisp
  cp ${pkgname#emacs-}.el{,c} $pkgdir/usr/share/emacs/site-lisp
}
