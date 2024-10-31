# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rain
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Rhythmicity Analysis Incorporating Non-parametric Methods'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-gmp
  r-multtest
)
optdepends=(
  r-biocstyle
  r-lattice
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fcb474d76359afd1e041ff8cb26e473f8f50be86cf0beedf8e9b6cf179b5a618')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
