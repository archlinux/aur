# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-epc
pkgver=0.1.1
pkgrel=4
pkgdesc="An RPC stack for Emacs Lisp"
url="https://github.com/kiwanami/emacs-epc"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-ctable' 'python-epc' 'emacs-deferred')
makedepends=('git')
provides=('emacs-epc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kiwanami/emacs-epc/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd emacs-epc-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile epc*.el
}

package() {
  cd emacs-epc-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/epc
  install -m644 epc*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/epc/
}
