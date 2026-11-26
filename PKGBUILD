# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Illumina450ProbeVariants.db
_pkgver=1.50.0
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
md5sums=('bd29112a23e4754b5f28d032d484b21c')
b2sums=('3ecfa58976bba8af48ada13b053b2d64286216ecd8ac79d0076f6c237f97d41d04484f533d3614315e9dd908d00766618a951fa53ed3d38b2ce45433b57cc1b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
