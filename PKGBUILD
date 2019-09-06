# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-buttercup 
pkgver=1.17
pkgrel=1
pkgdesc="Behavior-driven development framework for testing Emacs
Lisp code"
url="https://github.com/jorgenschaefer/emacs-buttercup"
arch=('any')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c22fb290068548f737c4febdc9ccad8a9b612ebba9f768528b805f639053a3f6')

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp
}
