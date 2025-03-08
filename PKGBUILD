# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mixtools
_pkgver=2.0.0.1
pkgname=r-${_pkgname,,}
pkgver=2.0.0.1
pkgrel=1
pkgdesc='Tools for Analyzing Finite Mixture Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-kernlab
  r-plotly
  r-scales
  r-segmented
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9aa341d85e418d481105da267f92a3def4504f7c143583617770c5d6aa8c97c1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
