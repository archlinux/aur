# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=perturbatr
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=4
pkgdesc='Statistical Analysis of High-Throughput Genetic Perturbation Screens'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-diffusr
  r-doparallel
  r-dplyr
  r-foreach
  r-formula.tools
  r-ggplot2
  r-igraph
  r-lazyeval
  r-lme4
  r-magrittr
  r-rlang
  r-scales
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-lintr
  r-rmarkdown
  r-testthat
)
makedepends=(
  git
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}_${_pkgver}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
