# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRLAB
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Dry lab for exploring miRNA-mRNA relationships'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  gsl
  r
  r-category
  r-ctc
  r-dplyr
  r-energy
  r-entropy
  r-glmnet
  r-gostats
  r-gplots
  r-hmisc
  r-httr
  r-impute
  r-invariantcausalprediction
  r-limma
  r-org.hs.eg.db
  r-pcalg
  r-rcurl
  r-stringr
  r-summarizedexperiment
  r-tcgabiolinks
)
optdepends=(
  r-annotationdbi
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eca511460a696ca5cdb701e043dcd1a49b156e97f0919b38d5691573b6ca8667')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
