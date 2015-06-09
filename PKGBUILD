# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=ggtags
pkgver=0.8.9
pkgrel=1
pkgdesc="Emacs frontend to GNU Global source code tagging system"
arch=('any')
url="https://github.com/leoliu/ggtags"
license=('GPL')
depends=('emacs' 'ctags')
install=$pkgname.install
source=("https://github.com/leoliu/$pkgname/archive/$pkgver.tar.gz")
md5sums=('35a0587c5b354c80ca45dad85c751737')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -m644 *.el* $pkgdir/usr/share/emacs/site-lisp
}
