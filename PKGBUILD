# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiClust
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='multiClust: An R-package for Identifying Biologically Relevant Clusters in Cancer Transcriptome Profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-amap
  r-ctc
  r-dendextend
  r-mclust
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-geoquery
  r-gplots
  r-knitr
  r-preprocesscore
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65ea46ada204dac27313a628bb35e3e855baa29c72fb224ba2bf5425d54c2a50')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
