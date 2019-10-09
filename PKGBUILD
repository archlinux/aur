# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-buttercup 
pkgver=1.18
pkgrel=1
pkgdesc="Behavior-driven development framework for testing Emacs
Lisp code"
url="https://github.com/jorgenschaefer/emacs-buttercup"
arch=('any')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2ea7eedf39ef0dd4219a9e018db81cbc438703a9f097e8f5cc9559a567cfa10c')

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp
}
