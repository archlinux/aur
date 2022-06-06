# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=homologene
_pkgver=1.4.68.19.3.27
pkgname=r-${_pkgname,,}
pkgver=1.4.68.19.3.27
pkgrel=4
pkgdesc='Quick Access to Homologene and Gene Annotation Updates'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-magrittr
  r-purrr
  r-r.utils
  r-readr
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('500760799dd6f8121596a3955c203afb0bc0560a31ec62820d136f3075ecfc34')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
