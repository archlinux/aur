# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ecume
_pkgver=0.9.1
pkgname=r-${_pkgname,,}
pkgver=0.9.1
pkgrel=4
pkgdesc='Equality of 2 (or k) Continuous Univariate and Multivariate Distributions'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-caret
  r-dplyr
  r-e1071
  r-kernlab
  r-magrittr
  r-pbapply
  r-spatstat
  r-spatstat.geom
  r-transport
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('912cd0bf8e86dccc9a3b8a28a423d911c2c3261d23c727dbdcfc4d0689e87e24')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
