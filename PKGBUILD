# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HubPub
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
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
sha256sums=('af1e4b388305cad630ff3f7e664a518e68550aa16853da4a86bcbbed17af518e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
