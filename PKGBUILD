# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-opus
pkgver=0.1.3
pkgrel=2
pkgdesc="OCaml bindings for Opus audio codec"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-opus"
license=('GPL2')
depends=('ocaml' 'opus' 'ocaml-ogg')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/savonet/ocaml-opus/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

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

sha256sums=('c12f71dba30a678244816a5367f2093ff3cda47461044916d1d3642144395f05')
