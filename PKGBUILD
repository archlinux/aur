# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=optimalFlowData
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='optimalFlowData'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('95d3e4f54fef000e3f31e509efa089d4470a4b29f161288c4b0c80c5c2c52e9e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
