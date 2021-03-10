# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-theora
pkgver=0.4.0
pkgrel=1
pkgdesc="OCaml binding to libtheora"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-theora"
license=('GPL2')
depends=('ocaml' 'libtheora' 'ocaml-ogg')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf examples
  dune build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"
  
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

sha256sums=('8793529d07d8959654f91c9b4c1e93d1cb1c7cef705220fbbd2956ccac7103cf')

