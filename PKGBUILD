# Maintainer: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=1.2.2
pkgrel=1
pkgdesc="OCaml Package Manager"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://opam.ocaml.org"
license=('GPL')
depends=('ocaml' 'aspcud')
source=( https://github.com/ocaml/opam/releases/download/${pkgver}/opam-full-${pkgver}.tar.gz)
sha1sums=('415ff0506378ab8dfa428fcd0aff3aa28337d93b')

build() {
  cd ${srcdir}/opam-full-${pkgver}
  ./configure --prefix=/usr
  make -j1 lib-ext
  make -j1
}

package() {
  cd ${srcdir}/opam-full-${pkgver}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
