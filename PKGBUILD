# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_typerep_conv
pkgver=0.11.1
pkgrel=1
epoch=1
pkgdesc="Generation of runtime types from type declarations"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_typerep_conv"
license=('Apache')
depends=('ocaml' 'ocaml-base' 'ocaml-typerep' 'ocaml-migrate-parsetree' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://github.com/janestreet/ppx_typerep_conv/archive/v${pkgver}.tar.gz")
md5sums=('826e9daf00258184e3392c970fa7d616')

build() {
  cd "${srcdir}/ppx_typerep_conv-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/ppx_typerep_conv-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
