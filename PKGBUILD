# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HubPub
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Utilities to create and use Bioconductor Hubs'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-available
  r-aws.s3
  r-biocmanager
  r-biocthis
  r-dplyr
  r-fs
  r-usethis
)
optdepends=(
  r-annotationhubdata
  r-biocstyle
  r-experimenthubdata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05c2a8c2a1776a276d69469204abcc12bd11d9732c8e979340e7873244bd516c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
