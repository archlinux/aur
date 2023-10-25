# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBGNview.data
_pkgver=1.15.0
pkgname=r-${_pkgname,,}
pkgver=1.15.0
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
sha256sums=('7e42561e9285eb2e161db77cefa82c492450e31fdb0a920a2cc8bf89d60a9a9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
