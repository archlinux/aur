# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggcyto
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Visualize Cytometry data with ggplot'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-flowcore
  r-flowworkspace
  r-ggplot2
  r-gridextra
  r-hexbin
  r-ncdfflow
  r-plyr
  r-rcolorbrewer
  r-rlang
  r-scales
)
optdepends=(
  r-flowstats
  r-flowviz
  r-flowworkspacedata
  r-ggridges
  r-knitr
  r-opencyto
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('350b154dca9d91a70bce97cd44f8fb37c36ce57525bc2f2993c30b49fd758c7c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
