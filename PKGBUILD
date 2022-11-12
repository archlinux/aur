# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mia
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Microbiome analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-decipher
  r-decontam
  r-delayedarray
  r-delayedmatrixstats
  r-dirichletmultinomial
  r-dplyr
  r-iranges
  r-multiassayexperiment
  r-rlang
  r-s4vectors
  r-scater
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-treesummarizedexperiment
  r-vegan
)
optdepends=(
  r-ade4
  r-biocstyle
  r-biomformat
  r-dada2
  r-knitr
  r-microbiomedatasets
  r-patchwork
  r-phyloseq
  r-reldist
  r-rmarkdown
  r-stringr
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ccfaca9cc948778e10bc6157fa95f69db0157c7abcc7cf1b63b934b3df43e87b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
