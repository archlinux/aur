# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=statTarget
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Statistical Analysis of Molecular Profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-impute
  r-pdist
  r-pls
  r-plyr
  r-randomforest
  r-roc
  r-rrcov
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('713720786457a77e453206bb149021408e7d00b5385d3062ac07472eaa4c748e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
