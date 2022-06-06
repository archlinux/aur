# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SQLDataFrame
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Representation of SQL database in DataFrame metaphor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-dbi
  r-dbplyr
  r-dplyr
  r-lazyeval
  r-rsqlite
  r-s4vectors
  r-tibble
)
optdepends=(
  r-bigrquery
  r-delayedarray
  r-knitr
  r-rmarkdown
  r-rmysql
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('168897f1e96f733298a53d01f867c5444f6a0c9005e81ea4d55426e76095775e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
