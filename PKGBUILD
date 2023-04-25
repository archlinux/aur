# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mRMRe
_pkgver=2.1.2.1
pkgname=r-${_pkgname,,}
pkgver=2.1.2.1
pkgrel=1
pkgdesc='Parallelized Minimum Redundancy, Maximum Relevance (mRMR)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d53c392e82a437005b71d0e8b97350d0237608fffafe087700fe7f6770167fd9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
