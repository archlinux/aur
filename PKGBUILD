# Maintainer: sballert <sballert@posteo.de>

pkgname=emacs-memoize
pkgver=1.1
pkgrel=1
pkgdesc="Elisp memoization functions"
url="https://github.com/skeeto/emacs-memoize"
arch=('any')
license=('UNLICENSE')
depends=('emacs')
provides=('emacs-memoize')
source=("https://github.com/skeeto/emacs-memoize/archive/${pkgver}.tar.gz")
sha256sums=('e4e50da02ef6a2ff3325c14a65e7f4ac2069cab05754797718bd574f227f3216')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  emacs -q --no-splash -batch -L . -f batch-byte-compile memoize*.el
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/memoize"
  install -m644 memoize*.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/memoize/"
}
