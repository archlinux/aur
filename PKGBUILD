# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromswitch
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='An R package to detect chromatin state switches from epigenomic data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('75a9c3afba7395a02eae635a1a9418e345f4d396532e96455d6b26945facafe9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
