# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggfortify
_pkgver=0.4.16
pkgname=r-${_pkgname,,}
pkgver=0.4.16
pkgrel=1
pkgdesc='Data Visualization Tools for Statistical Analysis Results'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-gridextra
  r-scales
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-changepoint
  r-cluster
  r-fgarch
  r-forecast
  r-ggrepel
  r-glmnet
  r-grdevices
  r-kfas
  r-knitr
  r-lfda
  r-lintr
  r-mapdata
  r-markdown
  r-mass
  r-mswm
  r-nlme
  r-raster
  r-rocr
  r-sp
  r-stats
  r-strucchange
  r-survival
  r-testthat
  r-timeseries
  r-tseries
  r-utils
  r-vars
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb1bee685cb97a9ac1b1a6592b96571752a9e195575a1584f1c046c53c510316')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
