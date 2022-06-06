# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=s4vd
_pkgver=1.1-1
pkgname=r-${_pkgname,,}
pkgver=1.1.1
pkgrel=3
pkgdesc='Biclustering via Sparse Singular Value Decomposition Incorporating Stability Selection'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biclust
  r-foreach
  r-irlba
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d79fea574904b7c3e527d9da6c4fffcf52420a65850d28485a3bd76e05f9e3e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
