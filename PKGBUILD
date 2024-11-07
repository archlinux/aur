# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBGNview.data
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('eb7d992aa9b92e52a9aa7698de9e8c1507a4f7f1904a216c7b0716a8eb7be6d8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
