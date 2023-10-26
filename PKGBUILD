# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowTime
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Annotation and analysis of biological dynamical systems using flow cytometry'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-flowcore
  r-magrittr
  r-plyr
  r-rlang
  r-tibble
)
optdepends=(
  r-biocgenerics
  r-flowclust
  r-flowstats
  r-flowviz
  r-ggcyto
  r-ggplot2
  r-knitr
  r-opencyto
  r-rmarkdown
  r-stats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d28bae15c268b869ea81effb2974560bbb7bffe3a8885dc0e621f41e6b41e88c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
