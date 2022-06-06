# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preseqR
_pkgver=4.0.0
pkgname=r-${_pkgname,,}
pkgver=4.0.0
pkgrel=4
pkgdesc='Predicting Species Accumulation Curves'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-polynom
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0143db473fb9a811f9cf582a348226a5763e62d9857ce3ef4ec41412abb559bc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
