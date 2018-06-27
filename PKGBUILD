# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-duppy
pkgver=0.7.0
pkgrel=1
pkgdesc="OCaml asynchronous scheduler and monad for server-oriented programming"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-duppy"
license=('LGPL2.1')
depends=('ocaml' 'camlp4' 'ocaml-pcre' 'ocaml-ssl')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-duppy/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('609d9116adc8835abb088d7e0bc27ac9')

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
