# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggdendro
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=0.2.0
pkgrel=1
pkgdesc="Create Dendrograms and Tree Diagrams Using 'ggplot2'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
)
optdepends=(
  r-cluster
  r-covr
  r-knitr
  r-rmarkdown
  r-rpart
  r-scales
  r-spelling
  r-testthat
  r-tree
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1940c34ddb30083a4c3bc3be98b6b466dcc78e03ac22a32088744db8bff7aa69')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
