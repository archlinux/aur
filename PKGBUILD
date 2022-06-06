# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ENCODExplorerData
_pkgver=0.99.5
pkgname=r-${_pkgname,,}
pkgver=0.99.5
pkgrel=4
pkgdesc='A compilation of ENCODE metadata'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-jsonlite
  r-rcurl
)
optdepends=(
  r-annotationhub
  r-biocgenerics
  r-curl
  r-httr
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('70cfc18dd800a084ec186826f3740c4397cf80359c4ac219d12ef78b68a9ee01')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
