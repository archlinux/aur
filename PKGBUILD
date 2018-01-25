# Maintainer: Oliver Bandel <oliver@first.in-berlin.de>
# Submitter: Morgan Howe <mthowe@gmail.com>
# Contributor: calimeroteknik@free.fr

pkgname=zarith
pkgver=1.7
pkgrel=1
pkgdesc='Implements arithmetic and logical operations over arbitrary-precision integers and rational numbers'
arch=(x86_64 i686)
url='https://github.com/ocaml/Zarith'
license=('GPL2')
depends=('gmp')
makedepends=('ocaml>=3.12.1' 'ocaml-findlib' )
source=("https://github.com/ocaml/Zarith/archive/release-${pkgver}.tar.gz")
md5sums=('80944e2755ebb848451a77dc2ad0651b')
sha256sums=('d641bb66d04461111b75f2fc37ad1eec764dcf326d98a51ac078695baea2ab3a')

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
