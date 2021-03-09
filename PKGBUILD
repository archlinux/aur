# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-gavl
pkgver=0.1.6
pkgrel=2
_commit=df62b5969c4b12e3d1d2c2cbb1a5f45a70353f7c
pkgdesc="OCaml bindings for the Gavl video manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-gavl"
license=('GPL2')
depends=('ocaml' 'gavl')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/${pkgname}/archive/${_commit}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  ./bootstrap
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
}

sha256sums=('2decc4402a0e08455d96ad9edd3bd729d62a5cc40e3468143ce48e471850256e')
