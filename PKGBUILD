# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRBaseConverter
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='A comprehensive and high-efficiency tool for converting and retrieving the information of miRNAs in different miRBase versions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-runit
  r-utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7c6bb80d764f6ddf783d30694b2209e5d620d56f4a475204231353704c74d213')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
