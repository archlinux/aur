# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=WGCNA
_pkgver=1.72-1
pkgname=r-${_pkgname,,}
pkgver=1.72.1
pkgrel=1
pkgdesc='Weighted Correlation Network Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-doparallel
  r-dynamictreecut
  r-fastcluster
  r-foreach
  r-go.db
  r-hmisc
  r-impute
  r-matrixstats
  r-preprocesscore
  r-rcpp
)
optdepends=(
  r-entropy
  r-infotheo
  r-minet
  r-org.hs.eg.db
  r-org.mm.eg.db
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1dbf82761ef3e76464b18fc9f698ad0f971aafecabf66ca937b950930bd57fdc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
