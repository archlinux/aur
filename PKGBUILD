# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cBioPortalData
_pkgver=2.14.1
pkgname=r-${_pkgname,,}
pkgver=2.14.1
pkgrel=1
pkgdesc='Exposes and makes available data from the cBioPortal web resources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-anvil
  r-biocfilecache
  r-digest
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-httr
  r-iranges
  r-multiassayexperiment
  r-raggedexperiment
  r-readr
  r-rtcgatoolbox
  r-s4vectors
  r-summarizedexperiment
  r-tcgautils
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-survival
  r-survminer
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82168ac83e8243a77ab691f4dd57f0211d5f153c9ee33f29f610b15bf4000201')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
