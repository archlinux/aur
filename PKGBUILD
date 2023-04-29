# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GISPA
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='GISPA: Method for Gene Integrated Set Profile Analysis'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-changepoint
  r-data.table
  r-genefilter
  r-gseabase
  r-hh
  r-latticeextra
  r-plyr
  r-scatterplot3d
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df2aba8a72999e7a2f22ae133666109c80461f36c4d99a940fc215c064b5a056')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
