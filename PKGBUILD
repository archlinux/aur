# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowMerge
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=2.50.0
pkgrel=1
pkgdesc='Cluster Merging for Flow Cytometry Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-feature
  r-flowclust
  r-flowcore
  r-foreach
  r-graph
  r-rgraphviz
  r-rrcov
  r-snow
)
optdepends=(
  r-domc
  r-knitr
  r-multicore
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cbd7a2e4ffdac86fb0fe36fa1f9b5adb277fd882a8fb3ea793031546f1dd6701')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
