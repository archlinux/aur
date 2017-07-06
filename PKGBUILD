# Maintainer: Oliver Bandel <oliver@first.in-berlin.de>
# Submitter: Morgan Howe <mthowe@gmail.com>
# Contributor: calimeroteknik@free.fr

pkgname=zarith
pkgver=1.5
pkgrel=1
pkgdesc='Implements arithmetic and logical operations over arbitrary-precision integers and rational numbers'
arch=(x86_64 i686)
url='https://github.com/ocaml/Zarith'
license=('GPL2')
depends=('gmp')
makedepends=('ocaml>=3.12.1')
source=("https://github.com/ocaml/Zarith/archive/release-${pkgver}.tar.gz")
md5sums=('2b037ad0e8145bf62979ea96e7a0ce24')

build() {
  cd Zarith-release-${pkgver}

  ./configure -installdir "${pkgdir}/usr/lib/ocaml" # install ignores DESTDIR
  make
}

package() {
  cd Zarith-release-${pkgver}

  mkdir -p "${pkgdir}/usr/lib/ocaml"
  OCAMLFIND_LDCONF=ignore make install
}
