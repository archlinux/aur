# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qsmooth
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Smooth quantile normalization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-hmisc
  r-summarizedexperiment
  r-sva
)
optdepends=(
  r-biocstyle
  r-bodymaprat
  r-knitr
  r-quantro
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9286bff5c1d521ddcde081b69652714752b2457a98729be3a593e1fcaaec8799')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
