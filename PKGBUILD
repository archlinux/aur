# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mRMRe
_pkgver=2.1.2
pkgname=r-${_pkgname,,}
pkgver=2.1.2
pkgrel=4
pkgdesc='Parallelized Minimum Redundancy, Maximum Relevance (mRMR)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a59a3cb3cca89f51d9ee6702cd479fd7db8bc2e25b72f45cb6712da983777ca0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
