# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TSRchitect
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=4
pkgdesc='Promoter identification from large-scale TSS profiling data'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-gtools
  r-iranges
  r-readxl
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-encodexplorer
  r-ggplot2
  r-knitr
  r-rmarkdown
)
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
