# Maintainer: %s <%s>
pkgname=emacs-buttercup 
pkgver=1.13
pkgrel=1
pkgdesc="Behavior-driven development framework for testing Emacs
Lisp code"
url="https://github.com/jorgenschaefer/emacs-buttercup/archive/v1.13.tar.gz"
arch=('any')
license=('GPL')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/jorgenschaefer/emacs-buttercup/archive/v$pkgver.tar.gz")
sha256sums=('69e0908d553efc67c7b758a012f7a8b7dedd0ef9296316ea3d4104ee8746ce67')

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/emacs/site-lisp/$pkgname
  cp *.el{,c} "$pkgdir"/usr/share/emacs/site-lisp/$pkgname
}
