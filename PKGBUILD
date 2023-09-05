# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HTSCluster
_pkgver=2.0.11
pkgname=r-${_pkgname,,}
pkgver=2.0.11
pkgrel=1
pkgdesc='Clustering High-Throughput Transcriptome Sequencing (HTS) Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-capushe
  r-edger
  r-plotrix
)
optdepends=(
  r-biobase
  r-htsfilter
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('77dd865197c859a3f47f68f5786fa0e24ce06a73ef9801e76c7425453d843a75')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
