# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GISPA
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('9f0edb08e51e9e8a86d06cd3fc5b303d7985878c67e8f6a6d13d95e49a636ba7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
