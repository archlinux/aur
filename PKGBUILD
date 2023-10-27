# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmetadb
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=1.64.0
pkgrel=3
pkgdesc='A compilation of metadata from NCBI GEO'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-geoquery
  r-rsqlite
)
optdepends=(
  r-dbplyr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-tm
  r-wordcloud
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f82b93dcf1d2e2a59e33cb681840c0117e83215e24bad0b102fbcc290276e687')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
