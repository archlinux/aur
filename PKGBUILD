# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MoonlightR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Identify oncogenes and tumor suppressor genes from omics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-circlize
  r-clusterprofiler
  r-doparallel
  r-dose
  r-foreach
  r-geoquery
  r-gplots
  r-hiver
  r-limma
  r-parmigene
  r-randomforest
  r-rcolorbrewer
  r-rismed
  r-summarizedexperiment
  r-tcgabiolinks
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-png
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('94e03c023084323dceea303e7927fbfb3342bcaecd9a7f496b74f01d26952151')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
