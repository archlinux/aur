# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mCSEAdata
_pkgver=1.17.0
pkgname=r-${_pkgname,,}
pkgver=1.17.0
pkgrel=1
pkgdesc='Data package for mCSEA package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('72bcdd103bfdaab97bb4106528da0d2a87dd27b3ef67d2f07e779b4c8ec8b9ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
