# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=countsimQC
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Compare Characteristic Features of Count Data Sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-catools
  r-deseq2
  r-dplyr
  r-dt
  r-edger
  r-genefilter
  r-genomeinfodbdata
  r-ggplot2
  r-ragg
  r-randtests
  r-rmarkdown
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee3a3bfe14bc15d4f1c014f51e67e47ee327f95025f80847ef61c7b6ff893d7f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
