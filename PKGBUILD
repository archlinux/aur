# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmetadb
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
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
sha256sums=('edb100429f3c1f2660f5b543a2a0df83bb66e5cfea42eda663b22011f0129b33')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
