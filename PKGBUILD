# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HPiP
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Host-Pathogen Interaction Prediction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-caret
  r-corrplot
  r-dplyr
  r-ggplot2
  r-httr
  r-igraph
  r-magrittr
  r-proc
  r-protr
  r-prroc
  r-purrr
  r-readr
  r-stringr
  r-tibble
  r-tidyr
  r-mcl
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-biostrings
  r-colorspace
  r-e1071
  r-ggthemes
  r-gprofiler2
  r-gridextra
  r-kernlab
  r-knitr
  r-randomforest
  r-ranger
  r-rmarkdown
  r-runit
  r-summarizedexperiment
  r-tools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('303e72c2647bf2ae3f6a17b5a67d10b330c38f9391ddbc1996757f7030525ace')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
