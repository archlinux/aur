# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Illumina450ProbeVariants.db
_pkgver=1.40.0
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
md5sums=('41630d156139779b3f9de60383c7b53c')
b2sums=('f241889d7c09823eb961b498596b3f12b0deacfc53d92c8cf3ccdadc01c89828035e6b1875cfcbca88c9d681c5604648a80f79f4eadd41307827731ed58d7b36')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
