# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-duppy
pkgver=0.8.0
pkgrel=1
pkgdesc="OCaml asynchronous scheduler and monad for server-oriented programming"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-duppy"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-pcre' 'ocaml-ssl')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-duppy/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1c855123679a16ad73941b3f7d5ba5667a6e8fc79898b666f59ff1ca01c7c6374c935d66214518fa0ee2b18a7acb14062c7f5bfb296377e37f018bf4f42f8de3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
}
