# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-deferred
pkgver=0.5.0
pkgrel=1
pkgdesc="Simple asynchronous functions for emacs lisp"
url="https://github.com/kiwanami/emacs-deferred"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-deferred')
source=("https://github.com/kiwanami/emacs-deferred/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emacs-deferred-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/emacs-deferred-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/deferred"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/deferred/"
}