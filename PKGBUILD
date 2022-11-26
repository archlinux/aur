# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-s
pkgver=1.13.0
pkgrel=0
pkgdesc="The long lost Emacs string manipulation library."
arch=('any')
url="https://github.com/magnars/s.el"
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/s.el/archive/$pkgver.tar.gz")
sha256sums=('a29b75866a423954c8b003d9f0d760a3153938336873843d9b0ec223e0243f3f')

build() {
  cd s.el-$pkgver
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd s.el-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
