# Maintainer: nerflad <nerflad@gmail.com>

pkgname=ocaml-yojson
_oname=yojson
pkgver=1.4.0
pkgrel=1
pkgdesc='An optimized parsing and printing library for JSON'
arch=('i686' 'x86_64' 'armv7h')
options=('!makeflags' '!strip' 'staticlibs')
license=('BSD')
depends=('ocaml-biniou' 'ocaml-easy-format')
makedepends=('ocaml-findlib' 'ocamlbuild' 'cppo')
url="https://github.com/mjambon/yojson"
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('7d06340b769ed6ff5b2171a0e820d1e8f4337aef3929090fc976efe845639146')
build() {
    cd ${srcdir}/${_oname}-${pkgver}
    make all
}

package() {
    cd ${srcdir}/${_oname}-${pkgver}
    export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
    install -dm755 "$OCAMLFIND_DESTDIR"
    jbuilder install
}
