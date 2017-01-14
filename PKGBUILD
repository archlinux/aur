# Maintainer: oliver < a t >  first . in-berlin . de
pkgname=camlpdf
pkgver=2.2
pkgrel=1
pkgdesc="PDF-processing-library for OCaml"
arch=('i686' 'x86_64')
license=('LGPL')
source=(https://github.com/johnwhitington/camlpdf/archive/v$pkgver.tar.gz)
md5sums=('051400c4753eb788044fe4450f0b5174')
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
