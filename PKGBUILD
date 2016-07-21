# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=result
pkgname=ocaml-${_pkgname}
pkgver=1.2
pkgrel=1
pkgdesc="Compatibility Result module"
arch=('i686' 'x86_64')
depends=('ocaml')
makedepends=('ocaml-findlib')
url="https://github.com/janestreet/result"
license=('BSD')
options=('!strip')
source=("https://github.com/janestreet/result/archive/${pkgver}.tar.gz")
sha256sums=('7cf7909f902994dc885ceae1983e4cda3665914c774f774604d076b89f76f7dd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
