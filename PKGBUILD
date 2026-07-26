# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=Ckmeans.1d.dp
_pkgver=4.3.6
pkgname=r-${_pkgname,,}
pkgver=4.3.6
pkgrel=1
pkgdesc='Optimal, Fast, and Reproducible Univariate Clustering'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-rcpp
  r-rdpack
)
optdepends=(
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('187bb067505e1c9693100aa974e4104eb4d852536bd4abc5950c1a922b95e32f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
