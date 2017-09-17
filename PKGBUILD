# Maintainer: oliver < a t >  first . in-berlin . de
pkgname=camlpdf
pkgver=2.2.p1
pkgrel=1
pkgdesc="PDF-processing-library for OCaml"
arch=('i686' 'x86_64')
license=('LGPL')
#source=(https://github.com/johnwhitington/camlpdf/archive/v$pkgver.tar.gz) # ORIG
source=(https://github.com/johnwhitington/camlpdf/archive/v2.2-patchlevel1.tar.gz) # v2.2-patchlevel1
md5sums=('dc3ff8bc4f2f3eae0df79fd0da6ad594')
url="https://github.com/johnwhitington/camlpdf"
depends=('glibc')
makedepends=('ocaml-findlib')
options=(!makeflags staticlibs)
#
build() {
#cd ${srcdir}/camlpdf-$pkgver # ORIG
cd ${srcdir}/camlpdf-2.2-patchlevel1 # v2.2-patchlevel1
#
OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
make OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}"
}
#
#
package() {
#cd ${srcdir}/camlpdf-$pkgver # ORIG
cd ${srcdir}/camlpdf-2.2-patchlevel1 # v2.2-patchlevel1
#
OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
mkdir -p ${OCAMLFIND_DESTDIR}
#
OCAMLFIND_LDCONF="$pkgdir/$(ocamlfind printconf ldconf)"
#
make install -d OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${OCAMLFIND_LDCONF}"
}
