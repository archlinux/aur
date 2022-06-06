# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MALDIquant
_pkgver=1.21
pkgname=r-${_pkgname,,}
pkgver=1.21
pkgrel=4
pkgdesc='Quantitative Analysis of Mass Spectrometry Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0771f82034aa6a77af67f3572c900987b7e6b578d04d707c6e06689d021a2ff8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
