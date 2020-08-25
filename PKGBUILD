# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-syslog
pkgver=2.0.1
pkgrel=1
pkgdesc="syslog(3) routines for OCaml"
arch=('x86_64')
url="https://github.com/geneanet/ocaml-syslog"
license=('LGPL')
depends=('ocaml' 'glibc')
makedepends=('dune')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/geneanet/ocaml-syslog/archive/v${pkgver}.tar.gz")
sha512sums=('dc7d4ac2250e7d1d35d8c1cbeb0e369e9a7a0f78cc13d1727b0a9cac047b4d4a587921acb2999ae887e0437c99b0a64b2d1d2bb091645e9c99353a856fa1d2f5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  dune install --destdir "${pkgdir}"
}
