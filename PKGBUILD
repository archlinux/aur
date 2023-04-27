# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPXpress
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='ChIPXpress: enhanced transcription factor target gene identification from ChIP-seq and ChIP-chip data using publicly available gene expression profiles'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biganalytics
  r-bigmemory
  r-biobase
  r-chipxpressdata
  r-frma
  r-geoquery
)
optdepends=(
  r-biocgenerics
  r-mouse4302.db
  r-mouse4302cdf
  r-mouse4302frmavecs
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6eca074fd93bfdbd16bc3e91a8b6af558336f6eb90f6fb698ab2ecf1b7ac1f23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
