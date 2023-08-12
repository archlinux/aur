# Maintainer: hamki <me@hamki.org>

pkgname=emacs-pg
pkgver=0.20
pkgrel=1
pkgdesc="Emacs Lisp socket-level interface to the PostgreSQL RDBMS"
url="https://github.com/emarsden/pg-el"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=()
provides=()
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emarsden/pg-el/archive/v${pkgver}.tar.gz")
sha256sums=('8cc4146d364e45bfaf9a785a1401151dec3c64d8d0584179a9af18868c71360e')

build() {
  cd "${srcdir}/pg-el-${pkgver}"
  emacs -Q -batch -L . -f batch-byte-compile *.el
 }

package() {
  cd "${srcdir}/pg-el-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-pg"
  install -m644 *.el* "${pkgdir}/usr/share/emacs/site-lisp/emacs-pg/"
}
