# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggcyto
_pkgver=1.26.4
pkgname=r-${_pkgname,,}
pkgver=1.26.4
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
sha256sums=('f2febbda6f07350778f96c841458389ba68fa786d7087483e57bb20d17d841de')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
