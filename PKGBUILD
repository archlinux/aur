# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ctgGEM
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=1.7.0
pkgrel=4
pkgdesc='Generating Tree Hierarchy Visualizations from Gene Expression Data'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-igraph
  r-monocle
  r-sincell
  r-summarizedexperiment
  r-tscan
)
optdepends=(
  r-biocstyle
  r-biomart
  r-hsmmsinglecell
  r-irlba
  r-knitr
  r-rmarkdown
  r-vgam
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('abb1cc74e7598e646df2a920557ddc0145d0ae068e07cdd7c844806cd2bfaa42')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
