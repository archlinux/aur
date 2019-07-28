# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-buttercup 
pkgver=1.16
pkgrel=1
pkgdesc="Behavior-driven development framework for testing Emacs
Lisp code"
url="https://github.com/jorgenschaefer/emacs-buttercup"
arch=('any')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d0ad27027d7be56d1aaa6b3d2c53cbd8dc834d29606998d14cfa29902e5b1004')

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp
}
