# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoDCall
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='Positive Droplet Calling for DNA Methylation Droplet Digital PCR'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-diptest
  r-dt
  r-ggplot2
  r-gridextra
  r-laplacesdemon
  r-mclust
  r-purrr
  r-readr
  r-rlist
  r-shiny
  r-shinyjs
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed63dda461b056a25840032977c2d3986c159b9d53a30d751970fd014d58b624')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
