# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Illumina450ProbeVariants.db
_pkgver=1.41.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation Package combining variant data from 1000 Genomes Project for Illumina HumanMethylation450 Bead Chip probes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('108cd7a51616205409a7b57a7b24eea8')
b2sums=('301b52ecf906be51d74aecca0bf49e571ac0f1c8401e6599c66b7a4b8e1deb3aae680920db95dd9c0562c820a6374fb3c96232a56322d28aa376b0074bb4afd1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
