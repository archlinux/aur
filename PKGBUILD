# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dorothea
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=1
pkgdesc='Collection Of Human And Mouse TF Regulons'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bcellviper
  r-dplyr
  r-magrittr
  r-viper
)
optdepends=(
  r-biobase
  r-biocstyle
  r-knitr
  r-pheatmap
  r-pkgdown
  r-rmarkdown
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-tibble
  r-tidyr
  r-utils
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9637ea3048e6d1768586e58f80a3ea926fe85cc3982878cb15cbd5a836a831b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
