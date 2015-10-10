# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ocamlsdl
pkgver=0.9.1
pkgrel=1
license=('LGPL2.1')
arch=('i686' 'x86_64')
pkgdesc=("OCaml interface to the SDL (Simple DirectMedia Layer) library")
url="https://sourceforge.net/projects/ocamlsdl/"
depends=('ocaml' 'ocaml-lablgl' 'sdl' 'sdl_ttf' 'sdl_image' 'sdl_mixer' 'sdl_gfx')
makedepends=('ocaml-findlib')
source=("http://downloads.sourceforge.net/project/ocamlsdl/OCamlSDL/${pkgname#ocaml-}-${pkgver}/${pkgname#ocaml-}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('c3086423991fcdc1ba468afd52fc112b')

build() {
    cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
    make install
}
