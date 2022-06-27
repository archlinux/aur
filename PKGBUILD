# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iCluster
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=2.1.0
pkgrel=6
pkgdesc='Integrative clustering of multiple genomic data types'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-catools
  r-gdata
  r-gplots
  r-gtools
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d97cdcba3b53cf10160c333976d2244c2ad5abb8154e194b1568b48376374326')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
