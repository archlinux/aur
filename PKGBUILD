# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kissDE
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Retrieves Condition-Specific Variants in RNA-Seq Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aod
  r-biobase
  r-deseq2
  r-doparallel
  r-dss
  r-foreach
  r-ggplot2
  r-gplots
  r-matrixstats
  r-aods3
  r-shiny
  r-shinycssloaders
  r-ade4
  r-factoextra
  r-dt
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d4dec78389d872fdda609e72e476b884334e56018baa0a80109d2983f5f8377b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
