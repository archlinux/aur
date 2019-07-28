# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-buttercup 
pkgver=1.14
pkgrel=1
pkgdesc="Behavior-driven development framework for testing Emacs
Lisp code"
url="https://github.com/jorgenschaefer/emacs-buttercup/archive/v1.13.tar.gz"
arch=('any')
license=('GPL')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/jorgenschaefer/emacs-buttercup/archive/v$pkgver.tar.gz")
sha256sums=('42ed3cf522ceab29e640a8eb2c4ba68d550186d43c7ce09cdb4861673628b83d')

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp
}
