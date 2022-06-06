# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=leiden
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=1
pkgdesc='R Implementation of Leiden Clustering Algorithm'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-reticulate
)
optdepends=(
  r-bipartite
  r-covr
  r-data.table
  r-devtools
  r-graphsim
  r-knitr
  r-markdown
  r-multinet
  r-multiplex
  r-network
  r-rcolorbrewer
  r-rmarkdown
  r-spelling
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cace86748c4aa1720508210658ee2f63f7875be5bac215084001fdc59d22e2bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
