# system requirements: libarmadillo: apt-get install -y libarmadillo-dev(deb), libblas: apt-get install -y libblas-dev (deb),liblapack: apt-get install -y liblapack-dev (deb),libarpack++2: apt-get install -y libarpack++2-dev (deb),gfortran: apt-get install -y gfortran (deb), libgmp3: apt-getinstall -y libgmp3-dev (deb), libfftw3: apt-get install -ylibfftw3-dev (deb), libtiff5: apt-get install -y libtiff5-dev(deb)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClusterR
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=1.3.3
pkgrel=1
pkgdesc='Gaussian Mixture Models, K-Means, Mini-Batch-Kmeans, K-Medoids and Affinity Propagation Clustering'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  blas
  r
  r-ggplot2
  r-gmp
  r-lifecycle
  r-rcpp
  r-rcpparmadillo
)
optdepends=(
  r-covr
  r-fd
  r-knitr
  r-openimager
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('26d7e34fcbb0d611cbcfe5581c664b80eb6f9d87a6c22a446e0a41a90d06b26e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
