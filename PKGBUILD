# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Illumina450ProbeVariants.db
_pkgver=1.45.0
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
md5sums=('9869971d5b2e3cd3fb26d5cc24d0ad59')
b2sums=('bfc4d0d6f6698fc5e63b7cee02da1bd76845e55f717f0427474def6c8ce7d4dd532958a8237183487ee638e7ac7613edfdfc1a220b774cda87286aa622e57dec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
