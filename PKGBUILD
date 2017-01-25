# Maintainer: Olivr Bandel <oliver@first.in-berlin.de>
# Submitter: Morgan Howe <mthowe@gmail.com>
# Contributor: calimeroteknik@free.fr

pkgname=zarith
pkgver=1.4.1
pkgrel=2
pkgdesc='Implements arithmetic and logical operations over arbitrary-precision integers and rational numbers'
arch=(x86_64 i686)
url='https://github.com/ocaml/Zarith'
license=('GPL2')
depends=('glibc')
makedepends=('ocaml>=3.08')
source=("https://github.com/ocaml/Zarith/archive/release-${pkgver}.tar.gz")
md5sums=('6b4886b457c1ee8c28763fe26cff9e48')

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
