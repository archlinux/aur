# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GCSscore
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='GCSscore: an R package for microarray analysis for Affymetrix/Thermo Fisher arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affxparser
  r-biobase
  r-biocmanager
  r-data.table
  r-devtools
  r-dplr
  r-rsqlite
  r-stringr
)
optdepends=(
  r-geoquery
  r-r.utils
  r-siggenes
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44e4441b954fcc03c961005a6af11eb1d5a573ca0801cc252be979c695d8b031')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
