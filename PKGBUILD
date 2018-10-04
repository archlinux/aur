# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-deferred
pkgver=0.5.1
pkgrel=2
pkgdesc="Simple asynchronous functions for emacs lisp"
url="https://github.com/kiwanami/emacs-deferred"
arch=('any')
license=('GPL3')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kiwanami/emacs-deferred/archive/v${pkgver}.tar.gz")
sha256sums=('941b49635cc80ff62c5f568f393b4262c8848b4d27bc88ae8da36549f072e168')

build() {
  cd emacs-deferred-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd emacs-deferred-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/
}
