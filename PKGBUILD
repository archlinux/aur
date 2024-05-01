# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HubPub
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('b51fc027a1b2d3170eea89b790b5ae2a36b00b7d05064a7a77627e38fbe0b80b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
