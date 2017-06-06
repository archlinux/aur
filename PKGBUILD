# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-archive
pkgver=2.8.4+2
pkgrel=1
pkgdesc="Bindings to libarchive with Lwt support"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/ocaml-archive/"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-fileutils' 'ocaml-lwt' 'ocaml-extlib' 'libarchive')
makedepends=('ocaml-findlib' 'ocaml-ounit')
options=('!strip')
source=("https://forge.ocamlcore.org/frs/download.php/1129/ocaml-archive-2.8.4+2.tar.gz")
md5sums=('5be75adde03a871c36f8a9ddacbba844')

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
