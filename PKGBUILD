# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=ppx_tools
pkgname=ocaml-${_pkgname}
pkgver=0.99.3
pkgrel=1
pkgdesc="Tools for authors of ppx rewriters and other syntactic tools"
arch=('i686' 'x86_64')
url="https://github.com/alainfrisch/ppx_tools"
license=('MIT')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("https://github.com/diml/${_pkgname}/archive/${_pkgname}_${pkgver}.tar.gz")
md5sums=('eeda1c5b2d790c4f566aeed5b960b910')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}_${pkgver}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}_${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"

  make install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
