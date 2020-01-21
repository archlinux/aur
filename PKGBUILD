# Maintainer: Lance Roy <ldr709@gmail.com>

srcname='dolog'
pkgname="ocaml-${srcname}"
pkgver='4.0.0'
pkgrel=1
pkgdesc='A dumb OCaml logger'
arch=('i686' 'x86_64')
url="https://github.com/UnixJunkie/dolog"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml'
    'ocaml-findlib'
    'dune')
source=("https://github.com/UnixJunkie/${srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('bd5b57e9954cc0b6750016e820b0ca8293207e2f337d465937a0f1d91430b503')
options=('staticlibs')

build() {
    cd "$srcdir/${srcname}-${pkgver}"

    env DESTDIR="$pkgdir" \
        make
}


package() {
    cd "$srcdir/${srcname}-${pkgver}"

    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    env DESTDIR="$pkgdir" \
        make install
}
