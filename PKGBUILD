# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IPO
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Automated Optimization of XCMS Data Processing parameters'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-camera
  r-rsm
  r-xcms
)
optdepends=(
  r-biocgenerics
  r-faahko
  r-knitr
  r-msdata
  r-mtbls2
  r-parallel
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66ae8ee9927d7c96686f44e4f88048a2248661e065bf4d987459a551bf17196b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
