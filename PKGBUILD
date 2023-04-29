# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGMQL
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='GenoMetric Query Language for R/Bioconductor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-data.table
  r-dplyr
  r-genomicranges
  r-glue
  r-httr
  r-plyr
  r-rgmqllib
  r-rjava
  r-rtracklayer
  r-s4vectors
  r-xml2
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4024b3843b4f27bd07e6dfd8d19b92598d77625bef6d0d77e584af222cb02d79')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
