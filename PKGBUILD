# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dlist
pkgver=0.1.0
pkgrel=1
license=('BSD')
arch=('i686' 'x86_64')
pkgdesc="Difference list library for OCaml"
url="https://github.com/BYVoid/Dlist"
depends=('ocaml' 'ocaml-ounit' 'ocaml-core_bench')
makedepends=('ocaml-findlib' 'ocp-build')
source=("https://github.com/BYVoid/Dlist/archive/v${pkgver}.tar.gz")
options=('!strip')
md5sums=('c1d4231c188b6e512e5037a32ed99039')

build() {
  cd "${srcdir}/Dlist-${pkgver}"

  ocp-build init  
  ocp-build build
}

package() {
  cd "${srcdir}/Dlist-${pkgver}"
  
  ocp-build install -install-destdir $pkgdir
}
