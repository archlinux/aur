# Maintainer: Stefan Husmann <stefan-husmann@t-online.de

pkgname=emacs-bui
pkgver=1.1.0
pkgrel=2
pkgdesc="Buffer interface library for Emacs"
arch=('any')
url="https://github.com/alezost/bui.el"
license=('GPL')
depends=('emacs')
makedepends=('git' 'emacs-dash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alezost/bui.el/archive/v1.1.0.tar.gz")
md5sums=('07d2f846dffecaf18bb44b9f075bd3cc')

build() {
  cd ${pkgname#emacs-}.el-$pkgver
  emacs -Q -batch -L . -L /usr/share/emacs/site-lisp -f batch-byte-compile *.el || true
}

package() {
  _pkg_emacs="$pkgdir/usr/share/emacs/site-lisp/"

  cd ${pkgname#emacs-}.el-$pkgver
  install -d $_pkg_emacs
  cp *.el{,c} $_pkg_emacs
}
