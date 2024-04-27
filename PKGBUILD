# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromswitch
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=3
pkgdesc='An R package to detect chromatin state switches from epigenomic data'
arch=('any')
url="https://bioconductor.org/packages/3.17/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-biocparallel
  r-dplyr
  r-genomicranges
  r-gplots
  r-iranges
  r-lazyeval
  r-magrittr
  r-matrixstats
  r-nmf
  r-rtracklayer
  r-s4vectors
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-desctools
  r-devtools
  r-genomeinfodb
  r-knitr
  r-mclust
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0736f76aed1d4d1200f14701c62d0bc965a9a51b6bc03b86927742801252fc00')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
