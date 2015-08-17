# Maintainer: Morgan Howe <mthowe@gmail.com>
# Contributor: calimeroteknik@free.fr

pkgname=zarith
pkgver=1.3
pkgrel=1
pkgdesc='Implements arithmetic and logical operations over arbitrary-precision integers'
arch=(x86_64 i686)
url='http://forge.ocamlcore.org/projects/zarith'
license=('GPL2')
depends=('glibc')
makedepends=('ocaml>=3.08')
source=("http://forge.ocamlcore.org/frs/download.php/1471/${pkgname}-${pkgver}.tgz")
md5sums=('9ed8ddafdebfa8c1b673dbe91a181f66')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure -installdir "${pkgdir}/usr/lib/ocaml" # install ignores DESTDIR
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/lib/ocaml"
  OCAMLFIND_LDCONF=ignore make install
}
