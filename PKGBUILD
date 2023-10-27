# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dorothea
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Collection Of Human And Mouse TF Regulons'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bcellviper
  r-decoupler
  r-dplyr
  r-magrittr
)
optdepends=(
  r-biobase
  r-biocstyle
  r-knitr
  r-omnipathr
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
  r-viper
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f0492cce3af5a1da9e7a3af7c6b41728fbc0b77ed66144b89312127a598f36ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
