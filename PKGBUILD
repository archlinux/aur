# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qlcMatrix
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=0.9.7
pkgrel=4
pkgdesc='Utility Sparse Matrix Functions for Quantitative Language Comparison'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-docopt
  r-slam
  r-sparsesvd
)
optdepends=(
  r-knitr
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ef5e0350cfbdb07fca761fc7251584d39d3da2958ea813498b467e4f7661347')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
