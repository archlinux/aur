# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PoDCall
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ccad898f911de80d7f8fb9d74866c01f452d743dfc3feb4de99671a03715f0ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
