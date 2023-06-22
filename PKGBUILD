# system requirements: systemPipeR can be used to run externalcommand-line software (e.g. short read aligners), but thecorresponding tool needs to be installed on a system.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=systemPipeR
_pkgver=2.6.3
pkgname=r-${_pkgname,,}
pkgver=2.6.3
pkgrel=1
pkgdesc='systemPipeR: NGS workflow and report generation environment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-crayon
  r-genomicranges
  r-ggplot2
  r-htmlwidgets
  r-magrittr
  r-rsamtools
  r-s4vectors
  r-shortread
  r-stringr
  r-summarizedexperiment
  r-yaml
)
optdepends=(
  r-annotate
  r-annotationdbi
  r-batchtools
  r-biocstyle
  r-deseq2
  r-dplyr
  r-dt
  r-edger
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-go.db
  r-grid
  r-iranges
  r-kableextra
  r-knitr
  r-limma
  r-rjson
  r-rmarkdown
  r-rtracklayer
  r-systempiperdata
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ad9077fabb05fd574bd7d4d473ff962960ddf02832e05e4865c8981dd8c1919')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
