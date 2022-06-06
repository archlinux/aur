# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowTime
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('d6cd8beef04648b9db890c9dc59ec1d51b9d7bc05767a445d1d9d9bc0ed266ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
