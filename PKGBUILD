# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Your Name <youremail@domain.com>

pkgname=ocp-build
pkgver=1.99.20_beta
pkgrel=1
pkgdesc="A build system for OCaml applications"
arch=('i686' 'x86_64')
url="http://www.typerex.org/ocp-build.html"
license=('GPL3')
depends=('ocaml' 'ocaml-findlib' 'ocaml-cmdliner')
source=("https://github.com/OCamlPro/ocp-build/archive/${pkgver/_/-}.tar.gz")
md5sums=('72d9c1b1a42d1873628e2d6e7529d8cb')

build() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  ./configure "--with-metadir=${pkgdir}$(ocamlfind printconf destdir)"
  make
}

package() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  make install prefix="${pkgdir}/usr"
}
