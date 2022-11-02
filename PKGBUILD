# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBGNview.data
_pkgver=1.11.0
pkgname=r-${_pkgname,,}
pkgver=1.11.0
pkgrel=1
pkgdesc='Supporting datasets for SBGNview package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('AGPL')
depends=(
  r
  r-bookdown
  r-knitr
  r-rmarkdown
)
optdepends=(
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8980543b009493c4122af0f15f90fa77cd50e3f52b7be88de4e1f5f9bd0b8a4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
