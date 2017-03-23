# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=ggtags
pkgver=0.8.12
pkgrel=1
pkgdesc="Emacs frontend to GNU Global source code tagging system"
arch=('any')
url="https://github.com/leoliu/ggtags"
license=('GPL')
depends=('emacs' 'ctags')
install=$pkgname.install
source=("https://github.com/leoliu/$pkgname/archive/$pkgver.tar.gz")
md5sums=('0a846274e38c14040a3f4674a4d97ddf')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/emacs/site-lisp
  install -m644 *.el* $pkgdir/usr/share/emacs/site-lisp
}
