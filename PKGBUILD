# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=phateR
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=1.0.7
pkgrel=3
pkgdesc='PHATE - Potential of Heat-Diffusion for Affinity-Based Transition Embedding'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-memoise
  r-reticulate
)
optdepends=(
  r-cowplot
  r-gridgraphics
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5c221d644f6ee6f69f03f7b73c93392c3bfe456cb71490a20022805bc33ab9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
