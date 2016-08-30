# Maintainer: Olivr Bandel <oliver@first.in-berlin.de>
# Submitter: Morgan Howe <mthowe@gmail.com>
# Contributor: calimeroteknik@free.fr

pkgname=zarith
pkgver=1.4.1
pkgrel=1
pkgdesc='Implements arithmetic and logical operations over arbitrary-precision integers'
arch=(x86_64 i686)
url='http://forge.ocamlcore.org/projects/zarith'
license=('GPL2')
depends=('glibc')
makedepends=('ocaml>=3.08')
source=("http://forge.ocamlcore.org/frs/download.php/1574/${pkgname}-${pkgver}.tgz")
md5sums=('9ab2482d57f632c9cb3d10149138bc6e')

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
