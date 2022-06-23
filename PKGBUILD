# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterProfiler
_pkgver=4.4.4
pkgname=r-${_pkgname,,}
pkgver=4.4.4
pkgrel=1
pkgdesc='A universal enrichment tool for interpreting omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-dose
  r-downloader
  r-dplyr
  r-enrichplot
  r-go.db
  r-gosemsim
  r-magrittr
  r-plyr
  r-qvalue
  r-rlang
  r-tidyr
  r-yulab.utils
)
optdepends=(
  r-annotationhub
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-reactomepa
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e5e23a5a1b9580f3801291affb2e547e2fd228e1190e9bce398a1b097c86b24c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
