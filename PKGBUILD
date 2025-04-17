# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MMUPHin
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Meta-analysis Methods with Uniform Pipeline for Heterogeneity in Microbiome Studies'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-cowplot
  r-dplyr
  r-fpc
  r-ggplot2
  r-igraph
  r-maaslin2
  r-metafor
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-curatedmetagenomicdata
  r-genefilter
  r-knitr
  r-magrittr
  r-phyloseq
  r-rmarkdown
  r-testthat
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('94fced4c4233307fb9876cdfff3e7a1f0601930dd519d26402e47379cd4a1135')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
