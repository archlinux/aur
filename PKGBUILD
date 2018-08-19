# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ag
pkgver=0.47
pkgrel=2
pkgdesc="An Emacs frontend to The Silver Searcher (binary name ag)"
arch=('any')
url="https://github.com/Wilfred/ag.el"
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-s')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wilfred/ag.el/archive/$pkgver.tar.gz")
md5sums=('930693d5e34da67d7f96f3aece2fab5b')

build() {
  cd "$srcdir"/ag.el-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$srcdir"/ag.el-$pkgver
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/ag/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/ag/
}
