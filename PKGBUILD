# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MPINet
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=6
pkgdesc='The package can implement the network-based metabolite pathway identification of pathways.'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-biasedurn
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1acd288a03f4d21c77d05a2992389a8d37d73b545d30a870794f5d0871bc83ff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
