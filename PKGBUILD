# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IPO
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
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
sha256sums=('b0b0e4b32f84f0ee136cc3fe5174a5f4eb4a17142c026e24b6fb5598e198e4d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
