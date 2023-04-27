# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oncomix
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Identifying Genes Overexpressed in Subsets of Tumors from Tumor-Normal mRNA Expression Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-ggrepel
  r-mclust
  r-rcolorbrewer
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rmysql
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0c996b71006217952f8bf0380812748c2779a26993d9d6bbb6b477e3900445bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
