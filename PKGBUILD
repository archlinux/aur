# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
pkgname=emacs-elscreen
pkgver=1.4.6
pkgrel=3
pkgdesc="Frame configuration management for GNU Emacs modelled after GNU Screen"
arch=('any')
url="http://www.morishima.net/~naoto/software/elscreen/index.php.en"
license=('GPL')
depends=('emacs')
makedepends=('emacs-apel')
install=$pkgname.install
source=(ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/elscreen-$pkgver.tar.gz)
md5sums=('67d6b8913957ccacefef09c549a939fd')

build() {
  cd $srcdir/elscreen-$pkgver
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "elscreen.el"))'
}

package() {
  cd $srcdir/elscreen-$pkgver
  install -d $pkgdir/usr/share/emacs/site-lisp
  cp elscreen.el{,c} $pkgdir/usr/share/emacs/site-lisp
}
