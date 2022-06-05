# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=brglm
_pkgver=0.7.2
pkgname=r-${_pkgname,,}
pkgver=0.7.2
pkgrel=4
pkgdesc='Bias Reduction in Binomial-Response Generalized Linear Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-profilemodel
)
optdepends=(
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('56098d2ce238478e7a27cacc4cdec0bc65f287fe746b38fbb1edda20c1675023')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
