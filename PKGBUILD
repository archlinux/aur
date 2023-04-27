# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowTime
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
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
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-stats
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f4647a27919af92e95b0509dc9ba9640abe0b9eac8674265e3ba77577cd17ad2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
