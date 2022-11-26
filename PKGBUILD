# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=leiden
_pkgver=0.4.3
pkgname=r-${_pkgname,,}
pkgver=0.4.3
pkgrel=3
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
  r-remotes
  r-rmarkdown
  r-spelling
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a464b4b860e621749b3b701bb7ceb07e23c1a36be241c3e13b18105eb980938')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
