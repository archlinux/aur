# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=el2org
pkgver=0.6.0
pkgrel=1
pkgdesc="Convert an elisp-file to an org-file"
arch=('any')
url="https://github.com/tumashu/$pkgname.git"
license=('GPL')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tumashu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('98e3a513f33130e9b47ef20d633b75f971521c38e3c43601176f73ae439da33d')

build() {
  cd $pkgname-$pkgver
  emacs -Q -batch -L . -f batch-byte-compile ${pkgname}.el
}
package() {
  cd $pkgname-$pkgver
  install -D -m 644 ${pkgname}.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname}.el
  install -D -m 644 ${pkgname}.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/${pkgname}.elc
  install -D -m 644 README.md \
	  "$pkgdir"/usr/share/doc/$pkgname/README.md
}
