# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methylGSA
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Gene Set Analysis Using the Outcome of Differential Methylation'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocparallel
  r-clusterprofiler
  r-ggplot2
  r-go.db
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-missmethyl
  r-org.hs.eg.db
  r-reactome.db
  r-robustrankaggreg
  r-shiny
  r-stringr
)
optdepends=(
  r-enrichplot
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a04b8f97cd0f68555f3a1a262490af075a7336d5dc58f2b0dbe0a749888d157')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
