# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

pkgname=emacs-python-environment
pkgver=0.0.2
pkgrel=1
pkgdesc="Python virtualenv API for Emacs Lisp"
url="https://github.com/tkf/emacs-python-environment"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-deferred')
makedepends=('git')
provides=('emacs-python-environment')
source=("https://github.com/tkf/emacs-python-environment/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emacs-python-environment-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile python-environment*.el
}

package() {
  cd "${srcdir}/emacs-python-environment-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/python-environment"
  install -m644 python-environment*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/python-environment/"
}