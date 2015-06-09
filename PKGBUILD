#Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=emacs-twittering-mode
_pkgname=${pkgname/#emacs-/}
pkgver=3.0.0
pkgrel=1
pkgdesc="An emacs major mode for Twitter"
arch=(any)
url="http://twmode.sourceforge.net/index.html"
license=('GPL')
depends=('emacs' 'curl')
install=
source=("http://cznic.dl.sourceforge.net/project/twmode/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('ab47a6a49f4279be948147a58e95927e')



build() {
  cd "$srcdir/$_pkgname-$pkgver"
  emacs -batch -q -f batch-byte-compile $_pkgname.el
}

package() {
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -m644 $srcdir/$_pkgname-$pkgver/$_pkgname.el{,c} $pkgdir/usr/share/emacs/site-lisp
}
