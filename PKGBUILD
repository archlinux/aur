# Maintainer: George Eleftheriou <eleftg>
# Contributor: jedbrown
# Contributor: mickele
# Contributor: gborzi
# Contributor: abenson

pkgname=metis
pkgver=5.1.0
pkgrel=1
pkgdesc="a set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices."
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license=("custom")
makedepends=("cmake")
install="${pkgname}.install"
arch=('i686' 'x86_64')
options=('docs')
source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/${pkgname}-${pkgver}.tar.gz")
sha256sums=("76faebe03f6c963127dbb73c13eab58c9a3faeae48779f049066a21c087c5db2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make config shared=1 prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  install -m644 -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
