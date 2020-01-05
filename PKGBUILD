# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-buttercup 
pkgver=1.19
pkgrel=1
pkgdesc="Behavior-driven development framework for testing Emacs
Lisp code"
url="https://github.com/jorgenschaefer/emacs-buttercup"
arch=('any')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8cd36a7992907b0f7138631d83388edf542911c59631b45a8e5ce81cc8ede6a7')

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp
}
