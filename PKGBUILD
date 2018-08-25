# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-python-environment
pkgver=0.0.2
pkgrel=2
pkgdesc="Python virtualenv API for Emacs Lisp"
url="https://github.com/tkf/emacs-python-environment"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-deferred')
makedepends=('git')
provides=('emacs-python-environment')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkf/emacs-python-environment/archive/${pkgver}.tar.gz")
sha256sums=('8855d036ee858b8cfebf02f003a042dc1c7f4b8b00bf4c103cb12668b7fa3146')

build() {
  cd emacs-python-environment-${pkgver}
  emacs -q --no-splash -batch -L . -f batch-byte-compile python-environment*.el
}

package() {
  cd emacs-python-environment-${pkgver}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/python-environment
  install -m644 python-environment*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/python-environment/
}
