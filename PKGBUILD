# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowClean
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=1
pkgdesc='flowClean'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bit
  r-changepoint
  r-flowcore
  r-sfsmisc
)
optdepends=(
  r-flowviz
  r-grid
  r-gridextra
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('df2e73f9dc829477db04ce48ba19215d7666bb8d1b50e88b5b703c8c7251b454')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
