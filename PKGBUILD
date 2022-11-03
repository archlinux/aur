# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fcScan
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='fcScan for detecting clusters of coordinates with user defined options'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-doparallel
  r-foreach
  r-genomicranges
  r-iranges
  r-plyr
  r-rtracklayer
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e321466f33275e08236499ab2f3db55556adcdd99d96bd8b6a827de25b3037d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
