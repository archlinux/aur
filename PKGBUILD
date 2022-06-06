# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMallow
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=1.1
pkgrel=4
pkgdesc="Fit Multi-Modal Mallows' Models to Ranking Data"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-combinat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('92bde4b75ae7bb60aabe451607d15deca123d63847c09c1173398d73c818cae8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
