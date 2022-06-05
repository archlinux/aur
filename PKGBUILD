# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustvarsel
_pkgver=2.3.4
pkgname=r-${_pkgname,,}
pkgver=2.3.4
pkgrel=4
pkgdesc='Variable Selection for Gaussian Model-Based Clustering'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bma
  r-foreach
  r-iterators
  r-mclust
)
optdepends=(
  r-doparallel
  r-knitr
  r-mass
  r-parallel
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3da13e4a58116f5bff59a934721f41c277569f03d57459929123cca02573fb43')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
