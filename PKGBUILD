# Maintainer: oliver < a t >  first . in-berlin . de
pkgname=camlpdf
pkgver=2.1.1
pkgrel=2
pkgdesc="PDF-processing-library for OCaml"
arch=('i686' 'x86_64')
license=('LGPL')
source=(https://github.com/johnwhitington/camlpdf/archive/v$pkgver.tar.gz)
md5sums=('a3df80d071cc8d13ed119f9826941361')
url="https://github.com/johnwhitington/camlpdf"
depends=('glibc')
makedepends=('ocaml-findlib')
options=(!makeflags staticlibs)
#
build() {
cd ${srcdir}/camlpdf-$pkgver
#
OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
make OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}"
}
#
#
package() {
cd ${srcdir}/camlpdf-$pkgver
#
OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
mkdir -p ${OCAMLFIND_DESTDIR}
#
OCAMLFIND_LDCONF="$pkgdir/$(ocamlfind printconf ldconf)"
#
make install -d OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${OCAMLFIND_LDCONF}"
}
