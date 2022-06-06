# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isa2
_pkgver=0.3.5
pkgname=r-${_pkgname,,}
pkgver=0.3.5
pkgrel=4
pkgdesc='The Iterative Signature Algorithm'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
)
optdepends=(
  r-biclust
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b9d41747b14b0e5ddd7b7abb143ab7fc9e818df24995ea680197e6d4002759f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
