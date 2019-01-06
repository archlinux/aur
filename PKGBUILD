# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-s
pkgver=1.12.0
pkgrel=2
pkgdesc="The long lost Emacs string manipulation library."
arch=('any')
url="https://github.com/magnars/s.el"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/s.el/archive/$pkgver.tar.gz")
md5sums=('5bbfc45a9360ef6def7037af3ca887b7')

build() {
  cd s.el-$pkgver
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd s.el-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
