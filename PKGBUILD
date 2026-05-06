# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Illumina450ProbeVariants.db
_pkgver=1.48.0
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
md5sums=('93474f56778915a1cc3baf0592675af6')
b2sums=('15e66932c5e7eeb456333107359e70fdeed304ba174676850ed59a8071f24aca84117c22b8498275f3766fe29d78873737efec137969b5d0f6b8b997ca281ad9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
