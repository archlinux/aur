# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ag
pkgver=0.48
pkgrel=1
pkgdesc="An Emacs frontend to The Silver Searcher (binary name ag)"
arch=('any')
url="https://github.com/Wilfred/ag.el"
license=('GPL3')
depends=('emacs' 'emacs-dash' 'emacs-s')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wilfred/ag.el/archive/$pkgver.tar.gz")
sha256sums=('e195907ecaddd5c91af1affc2eada98c60b49c0098e60b846997168a931abd09')

build() {
  cd ag.el-$pkgver
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ag.el-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
