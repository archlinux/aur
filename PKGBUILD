# Maintainer: hamki <hamki.do2000@gmail.com>

pkgname=emacs-pg
pkgver=1.2.4
pkgrel=1
pkgdesc="pg.el is an Emacs Lisp interface for PostgreSQL"
url="https://github.com/cbbrowne/pg.el"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=()
provides=()
conflicts=()
source=('emacs-pg::git+https://github.com/cbbrowne/pg.el')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/emacs-pg"
  emacs -Q -batch -L . -f batch-byte-compile *.el
 }

package() {
  cd "${srcdir}/emacs-pg"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-pg"
  install -m644 *.el* "${pkgdir}/usr/share/emacs/site-lisp/emacs-pg/"
}
