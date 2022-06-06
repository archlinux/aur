# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rlist
_pkgver=0.4.6.2
pkgname=r-${_pkgname,,}
pkgver=0.4.6.2
pkgrel=4
pkgdesc='A Toolbox for Non-Tabular Data Manipulation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-data.table
  r-jsonlite
  r-xml
  r-yaml
)
optdepends=(
  r-stringdist
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ebde658d897c8a27a90ebb892b9e2bad15e2ad75557a7352fb08cbb5604e0997')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
