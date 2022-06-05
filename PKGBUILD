# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cytometree
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
pkgrel=4
pkgdesc='Automated Cytometry Gating and Annotation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-cowplot
  r-ggplot2
  r-gofkernel
  r-igraph
  r-mclust
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-formatr
  r-knitr
  r-rmarkdown
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cab16863fb203eac7b1d21436c6cb23fa5e225728b8839837ade563ace56e7a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
